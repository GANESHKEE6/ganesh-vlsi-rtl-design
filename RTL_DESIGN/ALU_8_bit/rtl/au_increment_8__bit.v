`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 11:59:27 AM
// Design Name: 
// Module Name: au_increment_8__bit
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


module au_increment_8_bit(
    input [ 7 : 0 ]a, 
    output [ 15 : 0 ]y
    );
    
    assign y = a + 1'b1 ;
    
endmodule
