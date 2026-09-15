`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 09:18:00 AM
// Design Name: 
// Module Name: lu_and_8_bit
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


module lu_and_8_bit(
    input [7 : 0 ]a , [7 : 0 ] b ,
    output [ 7 : 0 ] y 
    );
    
    and(y , a , b ) ; 
    
endmodule
