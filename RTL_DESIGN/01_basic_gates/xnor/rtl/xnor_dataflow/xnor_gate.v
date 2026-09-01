`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 11:21:04 AM
// Design Name: 
// Module Name: xnor_gate
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


// EQUALITY DETECTOR 

module xnor_gate(
    input a , b ,
    output y 
    );
    
    assign y = ( a & b ) | ( ~ a & ~b )  ; 
    
endmodule
