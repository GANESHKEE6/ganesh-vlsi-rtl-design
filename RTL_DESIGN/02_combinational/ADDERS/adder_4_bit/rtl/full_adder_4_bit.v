`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 05:50:59 PM
// Design Name: 
// Module Name: full_adder_4_bit
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


module full_adder_4_bit(
    input wire [3:0] a, 
    input wire [3:0] b,
    input wire cin ,
    output wire [3:0] sum ,
    output wire cout 
    );
    
    
    wire cout0 ; 
    wire cout1 ;
    wire cout2 ;
    
    full_adder FA0(
        .A(a[0]),
        .B(b[0]),
        .Cin(cin),
        .SUM(sum[0]),
        .Cout(cout0)
    );
    
    full_adder FA1(
        .A(a[1]),
        .B(b[1]),
        .Cin(cout0),
        .SUM(sum[1]),
        .Cout(cout1)
    );
    
    full_adder FA2(
        .A(a[2]),
        .B(b[2]),
        .Cin(cout1),
        .SUM(sum[2]),
        .Cout(cout2)
    );
    
    full_adder FA3(
        .A(a[3]),
        .B(b[3]), 
        .Cin(cout2),
        .SUM(sum[3]),
        .Cout(cout)
    );
        
endmodule
