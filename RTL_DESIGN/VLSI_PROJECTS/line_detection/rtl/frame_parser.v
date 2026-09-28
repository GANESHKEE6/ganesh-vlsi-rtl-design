module frame_parser (
    input  wire       clk,

    input  wire [7:0] rx_data,
    input  wire       rx_ready,

    output reg [6:0]  pixel_x,
    output reg        pixel_value,
    output reg        pixel_valid,

    output reg        frame_done
);

    localparam WAIT_AA  = 2'd0;
    localparam WAIT_55  = 2'd1;
    localparam PIXELS   = 2'd2;
    localparam FINISH   = 2'd3;

    reg [1:0] state = WAIT_AA;

    always @(posedge clk) begin

        pixel_valid <= 1'b0;
        frame_done  <= 1'b0;

        case (state)

            // =================================================
            // WAIT FOR AA
            // =================================================

            WAIT_AA: begin

                if (rx_ready) begin

                    if (rx_data == 8'hAA) begin

                        state <= WAIT_55;

                    end

                end

            end

            // =================================================
            // WAIT FOR 55
            // =================================================

            WAIT_55: begin

                if (rx_ready) begin

                    if (rx_data == 8'h55) begin

                        pixel_x <= 0;

                        state <= PIXELS;

                    end
                    else if (rx_data == 8'hAA) begin

                        state <= WAIT_55;

                    end
                    else begin

                        state <= WAIT_AA;

                    end

                end

            end

            // =================================================
            // RECEIVE 128 PIXELS
            // =================================================

            PIXELS: begin

                if (rx_ready) begin

                    pixel_value <= rx_data[0];

                    pixel_valid <= 1'b1;

                    if (pixel_x == 127) begin

                        state <= FINISH;

                    end
                    else begin

                        pixel_x <= pixel_x + 1'b1;

                    end

                end

            end

            // =================================================
            // FRAME FINISHED
            // =================================================

            FINISH: begin

                frame_done <= 1'b1;

                pixel_x <= 0;

                state <= WAIT_AA;

            end

            default: begin

                state <= WAIT_AA;

            end

        endcase

    end

endmodule