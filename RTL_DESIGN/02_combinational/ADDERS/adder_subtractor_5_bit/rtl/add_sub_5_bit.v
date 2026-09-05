`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2026 06:59:16 PM
// Design Name: 
// Module Name: add_sub_5_bit
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


module add_sub_5_bit(
    input [ 3 : 0 ] a , 
    input [ 3 : 0 ] b , 
    input ctr , 
    output [ 3 : 0  ] s , 
    output cout 
    );
    
    wire c0 , c1 ,c2 , x_or[3:0];
    
    exor_gate x0(
        .a(ctr), 
        .b(b[0]), 
        .y(x_or[0])
    );
    
    exor_gate x1(
        .a(ctr), 
        .b(b[1]), 
        .y(x_or[1])
    );
    
    exor_gate x2(
        .a(ctr), 
        .b(b[2]), 
        .y(x_or[2])
    );
    
    exor_gate x3(
        .a(ctr), 
        .b(b[3]), 
        .y(x_or[3])
    );
    
    full_adder FA0(
        .a(a[0]),
        .b(x_or[0]), 
        .cin(ctr),
        .sum(s[0]), 
        .cout(c0)
    );
    
    
    full_adder FA1(
        .a(a[1]),
        .b(x_or[1]), 
        .cin(c0),
        .sum(s[1]), 
        .cout(c1)
    );
    
    full_adder FA2(
        .a(a[2]),
        .b(x_or[2]),
        .cin(c1),
        .sum(s[2]),
        .cout(c2)
    );
    
    full_adder FA3(
        .a(a[3]),
        .b(x_or[3]),
        .cin(c2),
        .sum(s[3]),
        .cout(cout)
    );
    
endmodule
