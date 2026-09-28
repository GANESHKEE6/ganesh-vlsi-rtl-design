`timescale 1ns / 1ps

module i2c_oled_display(
    input wire clk,
    input wire line_detected,
    output wire scl,
    inout wire sda
);
    // 400kHz I2C Clock Generation from 100MHz
    reg [7:0] clk_div = 0;
    reg i2c_clk = 0;
    always @(posedge clk) begin
        if (clk_div == 124) begin
            i2c_clk <= ~i2c_clk;
            clk_div <= 0;
        end else begin
            clk_div <= clk_div + 1;
        end
    end
    assign scl = i2c_clk;

    reg sda_out = 1;
    reg sda_dir = 1; 
    assign sda = sda_dir ? sda_out : 1'bz;

    reg [3:0] state = 0;
    reg [7:0] data_to_send;
    reg [3:0] bit_idx = 7;
    reg [4:0] init_step = 0;
    reg [15:0] boot_delay = 0;
    reg send_mode = 0; // 0 = Sending Init Commands, 1 = Sending Data

    // SSD1306 Initialization ROM
    wire [7:0] init_rom [0:10];
    assign init_rom[0] = 8'hAE; // Display OFF
    assign init_rom[1] = 8'hD5; // Set Display Clock Divide Ratio
    assign init_rom[2] = 8'h80; 
    assign init_rom[3] = 8'hA8; // Set Multiplex Ratio
    assign init_rom[4] = 8'h3F; 
    assign init_rom[5] = 8'h8D; // Charge Pump Setting
    assign init_rom[6] = 8'h14; // Enable charge pump
    assign init_rom[7] = 8'h20; // Memory Addressing Mode
    assign init_rom[8] = 8'h00; // Horizontal addressing mode
    assign init_rom[9] = 8'hAF; // Display ON
    assign init_rom[10]= 8'hA4; // Entire Display On

    always @(negedge i2c_clk) begin
        // Wait ~160ms for OLED hardware to power up
        if (boot_delay < 16'hFFFF) begin
            boot_delay <= boot_delay + 1;
            sda_dir <= 1; 
            sda_out <= 1; 
        end else begin
            case (state)
                0: begin // START Condition
                    sda_dir <= 1; sda_out <= 0;
                    state <= 1; bit_idx <= 7;
                    data_to_send <= 8'h78; // OLED I2C Address (0x3C << 1 | Write '0')
                end
                1: begin // Send Slave Address + Write Bit
                    sda_out <= data_to_send[bit_idx];
                    if (bit_idx == 0) state <= 2;
                    else bit_idx <= bit_idx - 1;
                end
                2: begin // Wait for ACK from OLED (Release SDA)
                    sda_dir <= 0; 
                    state <= 3;
                end
                3: begin // Check ACK and load Control Byte (0x00 for Cmd, 0x40 for Data)
                    sda_dir <= 1;
                    sda_out <= 0; // ACK low setup
                    state <= 4; bit_idx <= 7;
                    data_to_send <= (send_mode == 0) ? 8'h00 : 8'h40;
                end
                4: begin // Send Control Byte
                    sda_out <= data_to_send[bit_idx];
                    if (bit_idx == 0) state <= 5;
                    else bit_idx <= bit_idx - 1;
                end
                5: begin // Wait for ACK for Control Byte
                    sda_dir <= 0;
                    state <= 6;
                end
                6: begin // Load actual Payload (Init command or line status data)
                    sda_dir <= 1;
                    state <= 7; bit_idx <= 7;
                    if (send_mode == 0) begin
                        data_to_send <= init_rom[init_step];
                    end else begin
                        data_to_send <= line_detected ? 8'hFF : 8'h00;
                    end
                end
                7: begin // Send Payload Byte
                    sda_out <= data_to_send[bit_idx];
                    if (bit_idx == 0) state <= 8;
                    else bit_idx <= bit_idx - 1;
                end
                8: begin // Wait for ACK for Payload Byte
                    sda_dir <= 0;
                    state <= 9;
                end
                9: begin // STOP Condition / Advance Sequence
                    sda_dir <= 1; sda_out <= 0;
                    // Send STOP
                    sda_out <= 1; 
                    
                    if (init_step < 10) begin
                        init_step <= init_step + 1;
                        send_mode <= 0;
                    end else begin
                        send_mode <= 1; // Switch to continuously sending line status data
                    end
                    state <= 0; // Loop back to START
                end
            endcase
        end
    end
endmodule