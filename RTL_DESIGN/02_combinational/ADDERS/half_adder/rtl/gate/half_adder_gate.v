`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 01:57:40 PM
// Design Name: 
// Module Name: half_adder_gate
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


module half_adder_gate(
    input a , b ,
    output sum , carry 
    );
    
    xor(sum , a , b );
    and(carry , a , b );
    
endmodule
