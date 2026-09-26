`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2026 02:28:09 PM
// Design Name: 
// Module Name: uart_rx_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_rx_top(
    input clk,rst,rx,
    output [7:0] d_out ,
    output rdy 
    );
    wire brg_rx;
    BRG_RX bgr_rx(
        .clk(clk),
        .rst(rst),
        .rx_en(brg_rx)
    );
    
    uart_reciver uartrx(
        .clk(clk),
        .rst(rst),
        .rx_en(brg_rx),
        .rx(rx),
        .d_out(d_out),
        .rdy(rdy)
     );
        
endmodule
