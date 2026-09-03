`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 02:59:55 PM
// Design Name: 
// Module Name: full_subtractor_dataflow
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


module full_subtractor_dataflow(
    input a , b , cin , 
    output wire diff , wire borr 
    );
    
    assign diff = ( a ^ b ^ cin ) ; 
    assign borr = ( b & cin ) | ( ~a & b ) | ( ~a & cin ) ; 

endmodule
