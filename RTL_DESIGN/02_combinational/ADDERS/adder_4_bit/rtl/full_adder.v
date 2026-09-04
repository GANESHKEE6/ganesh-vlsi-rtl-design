`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 05:32:23 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input A , B ,Cin , 
    output SUM ,Cout
    );
    
    wire s1 ;
    wire co1;
    wire co2 ; 
   
    half_adder_dataflow ha1(
        .a(A),
        .b(B), 
        .sum(s1),
        .carry(co1)
    );
    
    half_adder_dataflow ha2(
        .a(s1),
        .b(Cin),
        .sum(SUM),
        .carry(co2)
    );
    
    or(Cout,co1,co2);
        
endmodule
