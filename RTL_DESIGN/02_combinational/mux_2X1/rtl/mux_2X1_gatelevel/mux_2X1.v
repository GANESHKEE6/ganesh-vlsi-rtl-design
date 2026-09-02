`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 03:45:19 PM
// Design Name: 
// Module Name: mux_2X1
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


module mux_2X1(
    input a , b , s0 , 
    output y 
    );
    
    wire w1 , w2 , w3;
    
    not( w1 , s0 ) ; 
    and( w3 , a , s0 ) ; 
    and( w2 , b , w1) ; 
    or(y ,w2 ,w3 );
        
endmodule

