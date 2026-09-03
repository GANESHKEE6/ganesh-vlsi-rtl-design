`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 06:29:41 AM
// Design Name: 
// Module Name: mux_4X1
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


module mux_4X1(
    input a , b , c , d , s0 , s1 ,
    output y
    );
    
    wire ns0 , ns1 , a1 ,a2 , a3 , a4 ;
    
    not n1(ns0 , s0 ) ; 
    
    not n2(ns1 , s1 ) ; 
    
    and and1( a1 , ns0 , ns1 , a ) ;
    
    and and2( a2 , ns0 , s1 , b ) ; 
    
    and and3( a3 ,s0 , ns1 , c ) ; 
    
    and and4( a4 , s0 , s1 ,d ) ; 
    
    or o1( y , a1 , a2 , a3 , a4 ); 
    
endmodule
