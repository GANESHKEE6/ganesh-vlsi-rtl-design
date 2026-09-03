`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 06:18:52 AM
// Design Name: 
// Module Name: mux_2X1_behavioral
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


module mux_2X1_behavioral(
    input a , b , s0 , 
    output reg y 
    );
    
    always @(*)  begin 
        
        y = ( a & ~ s0 ) | ( b & s0  ) ; 
    
    end
    
endmodule
