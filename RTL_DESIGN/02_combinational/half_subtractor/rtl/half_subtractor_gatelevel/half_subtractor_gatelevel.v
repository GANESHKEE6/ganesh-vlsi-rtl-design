`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 02:12:34 PM
// Design Name: 
// Module Name: half_subtractor_gatelevel
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


module half_subtractor_gatelevel(
    input a , b ,
    output differece , borrow
    );
    
    wire w1 ; 
    
    xor( differece ,  a , b ) ;
    not( w1 , a ) ; 
    and(borrow , w1 , b ) ; 
    
endmodule
