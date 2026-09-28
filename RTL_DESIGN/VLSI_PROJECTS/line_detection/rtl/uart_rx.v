module uart_rx #(
    parameter integer CLK_FREQ  = 100_000_000,
    parameter integer BAUD_RATE = 115200
)(
    input  wire       clk,
    input  wire       rx,

    output reg [7:0]  rx_data,
    output reg        rx_ready
);

    localparam integer BIT_TICKS  = CLK_FREQ / BAUD_RATE;
    localparam integer HALF_TICKS = BIT_TICKS / 2;

    localparam IDLE  = 2'd0;
    localparam START = 2'd1;
    localparam DATA  = 2'd2;
    localparam STOP  = 2'd3;

    reg [1:0] state = IDLE;

    reg [15:0] timer = 0;

    reg [2:0] bit_count = 0;

    reg [7:0] shift_reg = 0;

    always @(posedge clk) begin

        rx_ready <= 1'b0;

        case (state)

            // =================================================
            // IDLE
            // =================================================

            IDLE: begin

                timer <= 0;

                if (!rx) begin

                    state <= START;
                    timer <= 0;

                end

            end

            // =================================================
            // START BIT
            // =================================================

            START: begin

                if (timer == HALF_TICKS - 1) begin

                    timer <= 0;

                    if (!rx) begin

                        bit_count <= 0;
                        state <= DATA;

                    end
                    else begin

                        state <= IDLE;

                    end

                end
                else begin

                    timer <= timer + 1'b1;

                end

            end

            // =================================================
            // DATA
            // =================================================

            DATA: begin

                if (timer == BIT_TICKS - 1) begin

                    timer <= 0;

                    shift_reg <= {
                        rx,
                        shift_reg[7:1]
                    };

                    if (bit_count == 7) begin

                        state <= STOP;

                    end
                    else begin

                        bit_count <= bit_count + 1'b1;

                    end

                end
                else begin

                    timer <= timer + 1'b1;

                end

            end

            // =================================================
            // STOP
            // =================================================

            STOP: begin

                if (timer == BIT_TICKS - 1) begin

                    timer <= 0;

                    rx_data <= shift_reg;

                    rx_ready <= 1'b1;

                    state <= IDLE;

                end
                else begin

                    timer <= timer + 1'b1;

                end

            end

            default: begin

                state <= IDLE;

            end

        endcase

    end

endmodule