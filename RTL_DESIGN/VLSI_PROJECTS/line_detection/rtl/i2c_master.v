module i2c_master #(
    parameter integer CLK_FREQ = 100_000_000,
    parameter integer I2C_FREQ = 100_000
)(
    input  wire       clk,

    input  wire       start,
    input  wire       stop,
    input  wire       write,

    input  wire [7:0] write_data,

    output reg        busy,
    output reg        done,
    output reg        ack_error,

    output wire       scl,
    inout  wire       sda
);

    localparam integer HALF_PERIOD =
        CLK_FREQ / (I2C_FREQ * 2);

    reg [9:0] clk_count;

    reg tick;

    // ========================================================
    // I2C OUTPUTS
    // ========================================================

    reg scl_reg;

    reg sda_out;

    reg sda_oe;

    assign scl = scl_reg;

    assign sda = sda_oe ? sda_out : 1'bz;

    wire sda_in = sda;

    // ========================================================
    // CLOCK DIVIDER
    // ========================================================

    always @(posedge clk) begin

        if (clk_count == HALF_PERIOD - 1) begin

            clk_count <= 0;

            tick <= 1'b1;

        end
        else begin

            clk_count <= clk_count + 1'b1;

            tick <= 1'b0;

        end

    end

    // ========================================================
    // STATES
    // ========================================================

    localparam IDLE        = 4'd0;

    localparam START_1     = 4'd1;
    localparam START_2     = 4'd2;
    localparam START_3     = 4'd3;

    localparam WRITE_1     = 4'd4;
    localparam WRITE_2     = 4'd5;
    localparam WRITE_3     = 4'd6;
    localparam WRITE_ACK1  = 4'd7;
    localparam WRITE_ACK2  = 4'd8;

    localparam STOP_1      = 4'd9;
    localparam STOP_2      = 4'd10;
    localparam STOP_3      = 4'd11;

    reg [3:0] state = IDLE;

    reg [7:0] shift_reg;

    reg [3:0] bit_count;

    // ========================================================
    // I2C STATE MACHINE
    // ========================================================

    always @(posedge clk) begin

        done <= 1'b0;

        if (tick) begin

            case (state)

                // =================================================
                // IDLE
                // =================================================

                IDLE: begin

                    scl_reg <= 1'b1;

                    sda_oe <= 1'b0;

                    if (start) begin

                        state <= START_1;

                    end
                    else if (write) begin

                        shift_reg <= write_data;

                        bit_count <= 0;

                        state <= WRITE_1;

                    end
                    else if (stop) begin

                        state <= STOP_1;

                    end

                end

                // =================================================
                // START
                // =================================================

                START_1: begin

                    // Bus idle

                    scl_reg <= 1'b1;

                    sda_oe <= 1'b1;

                    sda_out <= 1'b1;

                    state <= START_2;

                end

                START_2: begin

                    // SDA HIGH -> LOW while SCL HIGH

                    scl_reg <= 1'b1;

                    sda_oe <= 1'b1;

                    sda_out <= 1'b0;

                    state <= START_3;

                end

                START_3: begin

                    scl_reg <= 1'b0;

                    sda_oe <= 1'b1;

                    sda_out <= 1'b0;

                    done <= 1'b1;

                    state <= IDLE;

                end

                // =================================================
                // WRITE BIT - LOW
                // =================================================

                WRITE_1: begin

                    scl_reg <= 1'b0;

                    sda_oe <= 1'b1;

                    sda_out <= shift_reg[7 - bit_count];

                    state <= WRITE_2;

                end

                // =================================================
                // WRITE BIT - HIGH
                // =================================================

                WRITE_2: begin

                    scl_reg <= 1'b1;

                    state <= WRITE_3;

                end

                // =================================================
                // WRITE BIT - LOW
                // =================================================

                WRITE_3: begin

                    scl_reg <= 1'b0;

                    if (bit_count == 7) begin

                        // Release SDA for ACK

                        sda_oe <= 1'b0;

                        state <= WRITE_ACK1;

                    end
                    else begin

                        bit_count <= bit_count + 1'b1;

                        state <= WRITE_1;

                    end

                end

                // =================================================
                // ACK HIGH
                // =================================================

                WRITE_ACK1: begin

                    scl_reg <= 1'b1;

                    state <= WRITE_ACK2;

                end

                // =================================================
                // ACK LOW
                // =================================================

                WRITE_ACK2: begin

                    if (sda_in == 1'b1)
                        ack_error <= 1'b1;
                    else
                        ack_error <= 1'b0;

                    scl_reg <= 1'b0;

                    done <= 1'b1;

                    state <= IDLE;

                end

                // =================================================
                // STOP
                // =================================================

                STOP_1: begin

                    scl_reg <= 1'b0;

                    sda_oe <= 1'b1;

                    sda_out <= 1'b0;

                    state <= STOP_2;

                end

                STOP_2: begin

                    scl_reg <= 1'b1;

                    state <= STOP_3;

                end

                STOP_3: begin

                    sda_oe <= 1'b0;

                    scl_reg <= 1'b1;

                    done <= 1'b1;

                    state <= IDLE;

                end

                default: begin

                    state <= IDLE;

                    scl_reg <= 1'b1;

                    sda_oe <= 1'b0;

                end

            endcase

        end

    end

    // ========================================================
    // BUSY
    // ========================================================

    always @(*) begin

        if (state == IDLE)
            busy = 1'b0;
        else
            busy = 1'b1;

    end

endmodule