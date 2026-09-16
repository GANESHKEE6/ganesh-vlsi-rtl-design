`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 09:58:57 AM
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
    input a , b , cin ,
    output s , c
    );
    
    wire s1 , c1 , c2 ; 
    
    half_adder ha1( 
        .a(a) , 
        .b(b) , 
        .s(s1) , 
        .c(c1) 
    );
    
    half_adder ha2(
        .a(s1) ,
        .b(cin) , 
        .s(s), 
        .c(c2)
    );
    
    or(c , c1 , c2 ) ; 
    
    
endmodule
