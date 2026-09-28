`timescale 1ns / 1ps

module i2c_write2 (
    input  wire       clk,
    input  wire       start,

    input  wire [7:0] byte0,
    input  wire [7:0] byte1,

    output reg        busy,
    output reg        done,

    output wire       scl,
    inout  wire       sda
);

    // =========================================================
    // 100 MHz clock
    // 500 clocks = 5 us
    // One SCL period = 10 us
    // I2C frequency = 100 kHz
    // =========================================================

    reg [8:0] clk_count;
    reg       tick;

    always @(posedge clk) begin
        if (clk_count == 9'd499) begin
            clk_count <= 9'd0;
            tick      <= 1'b1;
        end
        else begin
            clk_count <= clk_count + 1'b1;
            tick      <= 1'b0;
        end
    end


    // =========================================================
    // FSM
    // =========================================================

    localparam ST_IDLE       = 5'd0;
    localparam ST_START1     = 5'd1;
    localparam ST_START2     = 5'd2;

    localparam ST_BIT_LOW    = 5'd3;
    localparam ST_BIT_HIGH   = 5'd4;

    localparam ST_ACK_LOW    = 5'd5;
    localparam ST_ACK_HIGH   = 5'd6;

    localparam ST_STOP_LOW   = 5'd7;
    localparam ST_STOP_HIGH  = 5'd8;

    reg [4:0] state;

    reg [7:0] data0;
    reg [7:0] data1;

    reg [1:0] byte_number;
    reg [2:0] bit_number;

    reg       sda_oe;
    reg       sda_out;

    assign scl = (state == ST_START1)    ||
                 (state == ST_START2)    ||
                 (state == ST_BIT_HIGH)  ||
                 (state == ST_ACK_HIGH)  ||
                 (state == ST_STOP_HIGH);

    assign sda = sda_oe ? sda_out : 1'bz;


    // =========================================================
    // Current byte
    // =========================================================

    reg [7:0] current_byte;

    always @(*) begin

        case (byte_number)

            2'd0:
                current_byte = 8'h78;       // 0x3C << 1, WRITE

            2'd1:
                current_byte = data0;

            default:
                current_byte = data1;

        endcase

    end


    // =========================================================
    // Main FSM
    // =========================================================

    always @(posedge clk) begin

        done <= 1'b0;

        if (state == ST_IDLE) begin

            busy <= 1'b0;

            if (start) begin

                data0      <= byte0;
                data1      <= byte1;

                byte_number <= 2'd0;
                bit_number  <= 3'd7;

                busy <= 1'b1;

                state <= ST_START1;
            end

        end

        else if (tick) begin

            case (state)

                // -------------------------------------------------
                // START condition
                // SDA goes HIGH -> LOW while SCL is HIGH
                // -------------------------------------------------

                ST_START1: begin
                    state <= ST_START2;
                end


                ST_START2: begin
                    state <= ST_BIT_LOW;
                    bit_number <= 3'd7;
                end


                // -------------------------------------------------
                // Put data on SDA while SCL LOW
                // -------------------------------------------------

                ST_BIT_LOW: begin
                    state <= ST_BIT_HIGH;
                end


                // -------------------------------------------------
                // SCL HIGH
                // Receiver samples SDA here
                // -------------------------------------------------

                ST_BIT_HIGH: begin

                    if (bit_number == 3'd0) begin

                        state <= ST_ACK_LOW;

                    end

                    else begin

                        bit_number <= bit_number - 1'b1;
                        state <= ST_BIT_LOW;

                    end

                end


                // -------------------------------------------------
                // ACK clock
                // -------------------------------------------------

                ST_ACK_LOW: begin
                    state <= ST_ACK_HIGH;
                end


                ST_ACK_HIGH: begin

                    if (byte_number == 2'd2) begin

                        state <= ST_STOP_LOW;

                    end

                    else begin

                        byte_number <= byte_number + 1'b1;
                        bit_number <= 3'd7;

                        state <= ST_BIT_LOW;

                    end

                end


                // -------------------------------------------------
                // STOP
                // -------------------------------------------------

                ST_STOP_LOW: begin
                    state <= ST_STOP_HIGH;
                end


                ST_STOP_HIGH: begin

                    state <= ST_IDLE;

                    busy <= 1'b0;
                    done <= 1'b1;

                end


                default: begin
                    state <= ST_IDLE;
                    busy <= 1'b0;
                end

            endcase

        end

    end


    // =========================================================
    // SDA output control
    // =========================================================

    always @(*) begin

        sda_oe  = 1'b0;
        sda_out = 1'b1;

        case (state)

            ST_START1: begin
                sda_oe  = 1'b1;
                sda_out = 1'b1;
            end

            ST_START2: begin
                sda_oe  = 1'b1;
                sda_out = 1'b0;
            end

            ST_BIT_LOW: begin

                sda_oe  = 1'b1;

                if (current_byte[bit_number])
                    sda_out = 1'b1;
                else
                    sda_out = 1'b0;

            end

            ST_BIT_HIGH: begin

                sda_oe  = 1'b1;

                if (current_byte[bit_number])
                    sda_out = 1'b1;
                else
                    sda_out = 1'b0;

            end

            // Release SDA for slave ACK
            ST_ACK_LOW: begin
                sda_oe = 1'b0;
            end

            ST_ACK_HIGH: begin
                sda_oe = 1'b0;
            end

            ST_STOP_LOW: begin
                sda_oe  = 1'b1;
                sda_out = 1'b0;
            end

            ST_STOP_HIGH: begin
                sda_oe  = 1'b1;
                sda_out = 1'b1;
            end

            default: begin
                sda_oe  = 1'b0;
                sda_out = 1'b1;
            end

        endcase

    end

endmodule