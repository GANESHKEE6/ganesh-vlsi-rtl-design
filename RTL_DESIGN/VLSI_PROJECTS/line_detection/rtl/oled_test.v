
module oled_test #(
    parameter [1:0] TEST_MODE = 2'd1
)(
    input  wire clk,          // Basys 3 100 MHz clock
    output wire oled_scl,
    inout  wire oled_sda
);

    // TEST_MODE:
    // 0 = All pixels OFF
    // 1 = All pixels ON
    // 2 = Alternating pattern (0xAA)
    // 3 = Alternating pattern (0x55)

    reg [7:0] test_data;

    always @(*) begin
        case (TEST_MODE)
            2'd0: test_data = 8'h00;
            2'd1: test_data = 8'hFF;
            2'd2: test_data = 8'hAA;
            2'd3: test_data = 8'h55;
            default: test_data = 8'h00;
        endcase
    end

    // I2C driver signals
    reg [7:0] byte0 = 8'h00;
    reg [7:0] byte1 = 8'h00;
    reg start = 1'b0;

    wire done;

    i2c_write2_400k i2c_inst (
        .clk   (clk),
        .start (start),
        .byte0 (byte0),
        .byte1 (byte1),
        .done  (done),
        .scl   (oled_scl),
        .sda   (oled_sda)
    );

    // 50 ms power-up delay
    reg [22:0] power_count = 0;

    localparam POWERUP     = 4'd0;
    localparam INIT_SEND   = 4'd1;
    localparam INIT_WAIT   = 4'd2;
    localparam PAGE_SEND   = 4'd3;
    localparam PAGE_WAIT   = 4'd4;
    localparam LOW_SEND    = 4'd5;
    localparam LOW_WAIT    = 4'd6;
    localparam HIGH_SEND   = 4'd7;
    localparam HIGH_WAIT   = 4'd8;
    localparam DATA_SEND   = 4'd9;
    localparam DATA_WAIT   = 4'd10;
    localparam NEXT_BYTE   = 4'd11;

    reg [3:0] state = POWERUP;

    reg [4:0] init_index = 0;
    reg [2:0] page = 0;
    reg [6:0] column = 0;

    // SH1106 initialization sequence
    function [7:0] init_command;
        input [4:0] index;
        begin
            case (index)
                0:  init_command = 8'hAE;
                1:  init_command = 8'hD5;
                2:  init_command = 8'h80;
                3:  init_command = 8'hA8;
                4:  init_command = 8'h3F;
                5:  init_command = 8'hD3;
                6:  init_command = 8'h00;
                7:  init_command = 8'h40;
                8:  init_command = 8'hAD;
                9:  init_command = 8'h8B;
                10: init_command = 8'hA1;
                11: init_command = 8'hC8;
                12: init_command = 8'hDA;
                13: init_command = 8'h12;
                14: init_command = 8'h81;
                15: init_command = 8'h7F;
                16: init_command = 8'hD9;
                17: init_command = 8'h22;
                18: init_command = 8'hDB;
                19: init_command = 8'h20;
                20: init_command = 8'hA4;
                21: init_command = 8'hA6;
                22: init_command = 8'hAF;
                default: init_command = 8'hAE;
            endcase
        end
    endfunction

    always @(posedge clk) begin
        // Default to no start request
        start <= 1'b0;

        case (state)

            POWERUP: begin
                if (power_count >= 23'd4999999) begin
                    power_count <= 0;
                    init_index <= 0;
                    state <= INIT_SEND;
                end
                else begin
                    power_count <= power_count + 1'b1;
                end
            end

            // Send initialization commands
            INIT_SEND: begin
                byte0 <= 8'h00; // Command control byte
                byte1 <= init_command(init_index);
                start <= 1'b1;
                state <= INIT_WAIT;
            end

            INIT_WAIT: begin
                if (done) begin
                    if (init_index == 5'd22) begin
                        page <= 0;
                        state <= PAGE_SEND;
                    end
                    else begin
                        init_index <= init_index + 1'b1;
                        state <= INIT_SEND;
                    end
                end
            end

            // Select page 0 to 7
            PAGE_SEND: begin
                byte0 <= 8'h00;
                byte1 <= 8'hB0 | {5'b00000, page};
                start <= 1'b1;
                state <= PAGE_WAIT;
            end

            PAGE_WAIT: begin
                if (done)
                    state <= LOW_SEND;
            end

            // Column offset for SH1106 132-column RAM
            LOW_SEND: begin
                byte0 <= 8'h00;
                byte1 <= 8'h02;
                start <= 1'b1;
                state <= LOW_WAIT;
            end

            LOW_WAIT: begin
                if (done)
                    state <= HIGH_SEND;
            end

            HIGH_SEND: begin
                byte0 <= 8'h00;
                byte1 <= 8'h10;
                start <= 1'b1;
                state <= HIGH_WAIT;
            end

            HIGH_WAIT: begin
                if (done) begin
                    column <= 0;
                    state <= DATA_SEND;
                end
            end

            // Write 128 data bytes on this page
            DATA_SEND: begin
                byte0 <= 8'h40; // Display-data control byte
                byte1 <= test_data;
                start <= 1'b1;
                state <= DATA_WAIT;
            end

            DATA_WAIT: begin
                if (done)
                    state <= NEXT_BYTE;
            end

            NEXT_BYTE: begin
                if (column == 7'd127) begin
                    if (page == 3'd7) begin
                        // Test pattern remains displayed.
                        // Stop writing until FPGA is reset.
                        state <= NEXT_BYTE;
                    end
                    else begin
                        page <= page + 1'b1;
                        state <= PAGE_SEND;
                    end
                end
                else begin
                    column <= column + 1'b1;
                    state <= DATA_SEND;
                end
            end

            default: state <= POWERUP;

        endcase
    end

endmodule
