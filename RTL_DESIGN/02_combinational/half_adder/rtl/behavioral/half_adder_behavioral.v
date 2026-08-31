`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 12:21:48 PM
// Design Name: 
// Module Name: half_adder_behavioral
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


module half_adder_behavioral(
    input a,
    input b,
    output reg sum,
    output reg carry
    );
    
    always @(*) begin
    
    sum = a ^ b ;
    
    carry = a & b ;
    
    end
    
endmodule
