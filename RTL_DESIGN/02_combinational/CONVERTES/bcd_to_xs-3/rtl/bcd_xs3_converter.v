`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 08:34:17 PM
// Design Name: 
// Module Name: bcd_xs3_converter
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


module bcd_xs3_converter(
    input [3:0] a , 
    output [3:0] xs3  
    );
    
    assign xs3 = a + 4'b0011;
    
endmodule
