`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2026 11:08:55 AM
// Design Name: 
// Module Name: register_8_bit
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


module register_8_bit(
    input [ 7 : 0 ] d ,
    input rst ,
    input clk ,
    output  [ 7 : 0 ] q,
    output [7 : 0 ] q_bar
    );
    
    // instanciating d_ff to get register  
    d_ff d_ff_0 (d[0], rst, clk, q[0], q_bar[0]);
    d_ff d_ff_1 (d[1], rst, clk, q[1], q_bar[1]);
    d_ff d_ff_2 (d[2], rst, clk, q[2], q_bar[2]);
    d_ff d_ff_3 (d[3], rst, clk, q[3], q_bar[3]);
    d_ff d_ff_4 (d[4], rst, clk, q[4], q_bar[4]);
    d_ff d_ff_5 (d[5], rst, clk, q[5], q_bar[5]);
    d_ff d_ff_6 (d[6], rst, clk, q[6], q_bar[6]);
    d_ff d_ff_7 (d[7], rst, clk, q[7], q_bar[7]);
    
    
endmodule
