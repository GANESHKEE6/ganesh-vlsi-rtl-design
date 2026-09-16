`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 09:23:36 AM
// Design Name: 
// Module Name: lu_or_8_bit
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


module lu_or_8_bit(
    input [ 7 : 0 ] a , 
    input [ 7 : 0 ] b , 
    output[15 : 0 ] y 
    );
    
    assign y = ( a | b ) ;
endmodule
