`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 09:06:35 AM
// Design Name: 
// Module Name: D_latch_gatelevel
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


module D_latch_gatelevel(
    input d , 
    output q , qn  
    );
    
    wire n1 ; 
    
    not( n1 , d ) ;
    
    nand(q , d , qn ) ;
    nand(qn , n1 , q ) ; 
    
endmodule
