`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 03:04:31 PM
// Design Name: 
// Module Name: full_subtractor_behavioral
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


module full_subtractor_behavioral(
    input a , b , cin , 
    output reg diff , reg borr 
    );
    
    always @(*) begin 
    
        diff = ( a ^ b ^ cin ) ; 
        
        borr = ( b & cin ) | ( ~a & b ) | ( ~a & cin ) ; 
        
    end 
    
endmodule
