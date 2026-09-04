`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 09:14:33 AM
// Design Name: 
// Module Name: grey_code_to_binary_behavioral
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


module grey_code_to_binary_behavioral(
    input g0 , g1 , g2 , g3 , 
    output reg b0 , reg  b1 , reg b2 , reg b3 
    );
    
    always @(*) begin 
        b0 = g0 ;
        b1 = g1 ^ g0 ; 
        b2 = g2 ^ g1 ; 
        b3 = g3 ^ g2 ; 
    end
    
endmodule
