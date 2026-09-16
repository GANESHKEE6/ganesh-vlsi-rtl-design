`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 09:27:13 AM
// Design Name: 
// Module Name: lu_nor_8_bit
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


module lu_nor_8_bit(
    input [ 7 : 0 ] a,
    input [ 7 : 0 ] b, 
    output reg [ 15 : 0 ] y
    );
    
    always @ (*) begin 
        y = ~(a | b) ;
        
        end
    
endmodule
