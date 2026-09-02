`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 09:05:57 AM
// Design Name: 
// Module Name: mux_4X1_behavioral
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


module mux_4X1_behavioral(
    input a , b , c , d , 
    input s0 , s1 , 
    output reg y 
    );
    
    always @(*) begin 
    
    y = ( (~s0 & ~s1 & a ) | ( ~s0 & s1 & b ) | ( s0 & ~s1 & c ) | ( s0 & s1 & d ) ); 
    
    end
        
endmodule
