`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 11:43:51 AM
// Design Name: 
// Module Name: au_mul_8_bit
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


module au_mul_8_bit(
    input [ 7 : 0 ] a , 
    input [ 7 : 0 ] b , 
    output [ 15 : 0 ] y  
);

    assign y = ( a * b ) ;
    
endmodule
