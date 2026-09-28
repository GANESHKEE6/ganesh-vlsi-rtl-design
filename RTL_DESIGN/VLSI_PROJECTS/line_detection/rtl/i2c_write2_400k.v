`timescale 1ns / 1ps

module i2c_write2_400k (
    input  wire       clk,
    input  wire       start,
    input  wire [7:0] byte0,
    input  wire [7:0] byte1,

    output reg        busy = 1'b0,
    output reg        done = 1'b0,

    output wire       scl,
    inout  wire       sda
);
    // 100 MHz clock: one timing tick every 500 cycles.
// Two ticks per SCL period gives approximately 100 kHz.
reg [8:0] clk_count = 0;
reg tick = 0;

always @(posedge clk) begin
    if (clk_count == 9'd499) begin
        clk_count <= 0;
        tick <= 1'b1;
    end else begin
        clk_count <= clk_count + 1'b1;
        tick <= 1'b0;
    end
end
   

    localparam IDLE     = 4'd0;
    localparam START1   = 4'd1;
    localparam START2   = 4'd2;
    localparam BIT_LOW  = 4'd3;
    localparam BIT_HIGH = 4'd4;
    localparam ACK_LOW  = 4'd5;
    localparam ACK_HIGH = 4'd6;
    localparam STOP1    = 4'd7;
    localparam STOP2    = 4'd8;
    localparam STOP3    = 4'd9;

    reg [3:0] state = IDLE;
    reg [7:0] data0 = 0;
    reg [7:0] data1 = 0;
    reg [1:0] byte_number = 0;
    reg [2:0] bit_number = 0;

    reg sda_oe;
    reg [7:0] current_byte;

    always @(*) begin
        case (byte_number)
            2'd0: current_byte = 8'h78; // I2C address 0x3C, write
            2'd1: current_byte = data0;
            default: current_byte = data1;
        endcase
    end

    assign scl =
        (state == IDLE)     ||
        (state == START1)   ||
        (state == START2)   ||
        (state == BIT_HIGH) ||
        (state == ACK_HIGH) ||
        (state == STOP2)    ||
        (state == STOP3);

    // Open-drain SDA: FPGA drives LOW or releases the line.
    assign sda = sda_oe ? 1'b0 : 1'bz;

    always @(*) begin
        sda_oe = 1'b0;

        case (state)
            START2: sda_oe = 1'b1;

            BIT_LOW,
            BIT_HIGH: sda_oe = ~current_byte[bit_number];

            STOP1,
            STOP2: sda_oe = 1'b1;

            default: sda_oe = 1'b0;
        endcase
    end

    always @(posedge clk) begin
        done <= 1'b0;

        if (state == IDLE) begin
            busy <= 1'b0;

            if (start) begin
                data0 <= byte0;
                data1 <= byte1;
                byte_number <= 0;
                bit_number <= 3'd7;
                busy <= 1'b1;
                state <= START1;
            end
        end else if (tick) begin
            case (state)
                START1: state <= START2;

                START2: begin
                    bit_number <= 3'd7;
                    state <= BIT_LOW;
                end

                BIT_LOW: state <= BIT_HIGH;

                BIT_HIGH: begin
                    if (bit_number == 0) begin
                        state <= ACK_LOW;
                    end else begin
                        bit_number <= bit_number - 1'b1;
                        state <= BIT_LOW;
                    end
                end

                ACK_LOW: state <= ACK_HIGH;

                ACK_HIGH: begin
                    if (byte_number == 2) begin
                        state <= STOP1;
                    end else begin
                        byte_number <= byte_number + 1'b1;
                        bit_number <= 3'd7;
                        state <= BIT_LOW;
                    end
                end

                STOP1: state <= STOP2;
                STOP2: state <= STOP3;

                STOP3: begin
                    state <= IDLE;
                    busy <= 1'b0;
                    done <= 1'b1;
                end

                default: state <= IDLE;
            endcase
        end
    end

endmodule