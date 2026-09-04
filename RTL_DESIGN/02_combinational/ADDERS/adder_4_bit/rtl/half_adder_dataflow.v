`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 05:27:00 PM
// Design Name: 
// Module Name: half_adder_dataflow
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


module half_adder_dataflow(
    input a , b , 
    output sum , carry 
    );
    
    assign sum = ( a ^ b ) ; 
    assign carry = ( a & b ) ; 
    
endmodule
