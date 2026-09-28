module line_processor (
    input  wire       clk,

    input  wire       pixel_valid,
    input  wire [6:0] pixel_x,
    input  wire       pixel_value,

    input  wire       frame_done,

    output reg        line_detected,
    output reg [6:0]  line_position,
    output reg [1:0]  line_side
);

    localparam LEFT   = 2'd0;
    localparam CENTER = 2'd1;
    localparam RIGHT  = 2'd2;

    reg [15:0] sum_x;
    reg [7:0]  count;

    reg [15:0] final_sum;
    reg [7:0]  final_count;

    reg [6:0] calculated_position;

    initial begin

        sum_x = 0;
        count = 0;

        line_detected = 0;
        line_position = 64;
        line_side = CENTER;

    end

    always @(posedge clk) begin

        // =====================================================
        // ACCUMULATE LINE PIXELS
        // =====================================================

        if (pixel_valid && pixel_value) begin

            sum_x <= sum_x + pixel_x;

            count <= count + 1'b1;

        end

        // =====================================================
        // END OF FRAME
        // =====================================================

        if (frame_done) begin

            final_sum = sum_x;
            final_count = count;

            // ================================================
            // DETERMINE LINE
            // ================================================

            if (final_count >= 3) begin

                line_detected <= 1'b1;

                calculated_position =
                    final_sum / final_count;

                line_position <= calculated_position;

                // ============================================
                // CLASSIFICATION
                // ============================================

                if (calculated_position < 43) begin

                    line_side <= LEFT;

                end
                else if (calculated_position > 85) begin

                    line_side <= RIGHT;

                end
                else begin

                    line_side <= CENTER;

                end

            end
            else begin

                line_detected <= 1'b0;

                line_position <= 64;

                line_side <= CENTER;

            end

            // Reset accumulators
            sum_x <= 0;
            count <= 0;

        end

    end

endmodule