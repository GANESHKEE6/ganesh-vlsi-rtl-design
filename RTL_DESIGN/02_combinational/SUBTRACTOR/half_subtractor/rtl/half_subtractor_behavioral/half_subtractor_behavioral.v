`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 02:26:18 PM
// Design Name: 
// Module Name: half_subtractor_behavioral
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


module half_subtractor_behavioral(
    input a , b , 
    output reg difference , reg borrow 
    );
    
    always @(*) begin 
    
        difference = ( a ^ b ) ; 
        borrow = ( ~a & b ) ; 
        
    end 
endmodule
