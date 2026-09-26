`timescale 1ns / 1ps

module uart_tx_top (
    input  wire       clk,
    input  wire       rst,
    input  wire       wr_en,
    input  wire [7:0] d_in,
    output wire       tx
);
    wire tx_en;
    wire busy;

    baud_rate_generator BRG (
        .clk(clk),
        .rst(rst),
        .tx_en(tx_en)
    );

    uart_transmitter UARTTX (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .tx_en(tx_en),
        .d_in(d_in),
        .tx(tx),
        .busy(busy)
    );
endmodule