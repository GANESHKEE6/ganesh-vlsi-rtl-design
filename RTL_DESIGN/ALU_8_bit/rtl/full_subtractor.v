`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 10:45:57 AM
// Design Name: 
// Module Name: full_subtractor
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


module full_subtractor(
    input a , b , cin , 
    output d , bi
    );
    
    wire b1 , b2 , d1 ;
    
    half_subtractor s0(
        .a(a), 
        .b(b),
        .d(d1), 
        .bo(b1)
    );
    
    half_subtractor s1(
        .a(d1), 
        .b(cin),
        .d(d),
        .bo(b2)
    );
    
    or( bi , b1 , b2 ) ;
        
endmodule
