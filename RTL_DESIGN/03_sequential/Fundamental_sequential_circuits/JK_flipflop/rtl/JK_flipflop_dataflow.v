`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 11:27:59 AM
// Design Name: 
// Module Name: JK_flipflop_dataflow
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


module JK_flipflop_dataflow(
    input j , k , enable , 
    output q ,qn 
    );
    
    wire n1 , n2 , q1 , qn1 ; 
    
    assign n1 = ~( j & enable ) ; 
    
    assign n2 = ~( k & enable ) ; 
    
    assign q = ~ ( n1 & qn ) ; 
    
    assign qn = ~ ( n2 & q ) ; 
    
endmodule
