`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 08:58:56 AM
// Design Name: 
// Module Name: mux_4X1_dataflow
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


module mux_4X1_dataflow(
    input a , b , c , d , s0 , s1 ,
    output y 
    );
    
    assign y = ( (~s0 & ~s1 & a ) | ( ~s0 & s1 & b ) | ( s0 & ~s1 & c ) | ( s0 & s1 & d ) );
    
    
endmodule
