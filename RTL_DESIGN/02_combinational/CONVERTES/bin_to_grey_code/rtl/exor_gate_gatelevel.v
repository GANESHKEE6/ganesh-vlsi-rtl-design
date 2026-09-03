`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2026 08:39:33 PM
// Design Name: 
// Module Name: exor_gate_gatelevel
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


module exor_gate_gatelevel(
    input a , b , 
    output y 
    );
    
    wire  n1 , n2 , a1 , a2 ; 
    
    not(n1 , a ) ; 
    not(n2 , b ) ; 
    
    and(a1 , n2 , a ) ; 
    and(a2 , n1 , b ) ; 
    
    or(y , a1 , a2 ) ;
   
endmodule
