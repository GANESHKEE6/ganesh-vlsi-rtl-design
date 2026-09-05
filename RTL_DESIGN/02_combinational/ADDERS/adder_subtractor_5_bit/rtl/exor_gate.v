`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2026 06:59:50 PM
// Design Name: 
// Module Name: exor_gate
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


module exor_gate(
    input a , b , 
    output y 
    );
    
    assign y = ( ( a & ~b) | ( ~a & b ) );
    
endmodule
