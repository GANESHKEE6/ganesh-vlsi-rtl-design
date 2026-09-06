`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2026 06:54:02 PM
// Design Name: 
// Module Name: sr_latch_gatelevel
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


module sr_latch_gatelevel(
    input s , r ,
    output q , qn 
    );
    
    wire o1 , o2 ; 
    
    nand N1( q , s , qn ) ; 
    
    nand N2( qn , r , q ) ; 
    
endmodule
