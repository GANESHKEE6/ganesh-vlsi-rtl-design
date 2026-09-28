module top_level (
    input  wire clk,
    input  wire RsRx,

    output wire oled_scl,
    inout  wire oled_sda,

    output wire led
);

    // ========================================================
    // UART
    // ========================================================

    wire [7:0] rx_data;

    wire rx_ready;

    // ========================================================
    // FRAME PARSER
    // ========================================================

    wire [6:0] pixel_x;

    wire pixel_value;

    wire pixel_valid;

    wire frame_done;

    // ========================================================
    // LINE PROCESSOR
    // ========================================================

    wire line_detected;

    wire [6:0] line_position;

    wire [1:0] line_side;

    // ========================================================
    // LED
    // ========================================================

    assign led = line_detected;

    // ========================================================
    // UART RX
    // ========================================================

    uart_rx #(
        .CLK_FREQ(100_000_000),
        .BAUD_RATE(115200)
    ) u_uart_rx (

        .clk(clk),

        .rx(RsRx),

        .rx_data(rx_data),

        .rx_ready(rx_ready)

    );

    // ========================================================
    // FRAME PARSER
    // ========================================================

    frame_parser u_frame_parser (

        .clk(clk),

        .rx_data(rx_data),

        .rx_ready(rx_ready),

        .pixel_x(pixel_x),

        .pixel_value(pixel_value),

        .pixel_valid(pixel_valid),

        .frame_done(frame_done)

    );

    // ========================================================
    // LINE PROCESSOR
    // ========================================================

    line_processor u_line_processor (

        .clk(clk),

        .pixel_valid(pixel_valid),

        .pixel_x(pixel_x),

        .pixel_value(pixel_value),

        .frame_done(frame_done),

        .line_detected(line_detected),

        .line_position(line_position),

        .line_side(line_side)

    );

    // ========================================================
    // SH1106 OLED
    // ========================================================

    sh1106_oled u_oled (

        .clk(clk),

        .line_detected(line_detected),

        .line_position(line_position),

        .oled_scl(oled_scl),

        .oled_sda(oled_sda)

    );

endmodule