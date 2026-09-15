`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 09:53:16 AM
// Design Name: 
// Module Name: au_add_8_bit
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


module au_add_8_bit(
    input [ 7 : 0 ] a , 
    input [ 7 : 0 ] b , 
    input wire cin ,
    output [ 7 : 0 ] s ,
    output wire c
    );
    
    wire c0 , c1 , c2 , c3 , c4 , c5 , c6  ;
     
    full_adder fa_0(
        .a(a[0]),
        .b(b[0]), 
        .cin(cin), 
        .s(s[0]),
        .c(c0) 
    );
    
    full_adder fa_1(
        .a(a[1]), 
        .b(b[1]),
        .cin(c0),
        .s(s[1]),
        .c(c1)
    );
    
    full_adder fa_2(
        .a(a[2]), 
        .b(b[2]), 
        .cin(c1), 
        .s(s[2]),
        .c(c2)
    );
    
    full_adder fa_3(
        .a(a[3]) , 
        .b(b[3]) ,
        .cin(c2), 
        .s(s[3]) , 
        .c(c3)
    );
    
    full_adder fa_4(
        .a(a[4]), 
        .b(b[4]),
        .cin(c3),
        .s(s[4]),
        .c(c4) 
    );
    
    full_adder fa_5(
        .a(a[5]) , 
        .b(b[5]) ,
        .cin(c4) , 
        .s(s[5]), 
        .c(c5)
    );
    
    full_adder fa_6(
        .a(a[6]), 
        .b(b[5]), 
        .cin(c5), 
        .s(s[6]),
        .c(c6)
    );
    
    full_adder fa_7(
        .a(a[7]),
        .b(b[7]),
        .cin(c6),
        .s(s[7]),
        .c(c)
    );
    
endmodule
