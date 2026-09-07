`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 11:22:44 AM
// Design Name: 
// Module Name: JK_flipflop_gatelevel
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


module JK_flipflop_gatelevel(
    input j , k , enable , 
    output q , qn 
    );
    
    wire n1 , n2  ,q1 ,qn1 ;
    
    nand (n1 , j , enable ) ; 
    nand (n2 , k , enable ) ; 
    
    nand(q , n1 , qn );
    nand(qn , n2 , q );
    
    
    
endmodule
