`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 02:54:50 PM
// Design Name: 
// Module Name: full_subtractor_gatelevel
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


module full_subtractor_gatelevel(

    input a , b , cin ,
    output  diff , borr 
    );
    
    wire  w1 , w2 , w3 ; 
    xor(diff , a , b , cin ) ; 
    
    and(w1 , b , c ) ; 
    and(w2 , ~a , b ) ; 
    and(w3 , ~a , c ) ; 
    
    or( borr , w1 , w2 , w3 ) ; 
    
    
endmodule
