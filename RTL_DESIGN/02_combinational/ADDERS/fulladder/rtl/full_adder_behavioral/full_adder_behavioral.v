`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 01:53:14 PM
// Design Name: 
// Module Name: full_adder_behavioral
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


module full_adder_behavioral(
    input a , b , cin , 
    output reg sum , reg cout 
    );
    
    always @(*) begin
        
        sum = ( a ^ b ^ cin ) ; 
        
        cout = ( a & b ) | ( b & cin ) | ( a & cin ) ;
    
    end
    
endmodule
