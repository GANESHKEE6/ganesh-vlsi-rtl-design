`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 06:14:11 AM
// Design Name: 
// Module Name: mux_2X1_dataflow
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


module mux_2X1_dataflow(
    input a , b , s0 , 
    output wire y 
    );
    
    assign y = ( a & ~ s0 ) | (b & s0 )  ;
    
endmodule 
