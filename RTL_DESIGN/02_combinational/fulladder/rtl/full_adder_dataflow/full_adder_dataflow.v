`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 01:45:29 PM
// Design Name: 
// Module Name: full_adder_dataflow
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


module full_adder_dataflow(
    input a , b , cin , 
    output sum , cout
    );
    
    assign sum = ( a ^ b ^ cin ) ; 
    assign cout = ( a & b ) | ( b & cin ) | ( a & cin ) ;
    
endmodule
