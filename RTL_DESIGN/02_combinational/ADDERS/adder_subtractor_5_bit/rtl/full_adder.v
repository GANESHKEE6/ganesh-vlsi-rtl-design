`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2026 07:04:21 PM
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
    output sum , cout 
    );
    
    wire s1 , c1 , c2 ; 
    
    half_adder HA_0(
        .a(a),
        .b(b),
        .sum(s1),
        .carry(c1)
    );
    
    half_adder HA_1(
        .a(s1),
        .b(cin),
        .sum(sum),
        .carry(c2)
    );
    
    or(cout , c1 , c2 ); 
    
endmodule
