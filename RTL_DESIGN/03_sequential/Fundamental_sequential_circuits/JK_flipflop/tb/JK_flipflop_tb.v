`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 11:54:23 AM
// Design Name: 
// Module Name: JK_flipflop_tb
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


module JK_flipflop_tb;
    reg j ; 
    reg k ; 
    reg enable ;
    wire q ; 
    wire qn ; 
    
    JK_flipflop_behavioral DUT(
        .j(j),
        .k(k),
        .enable(enable),
        .q(q),
        .qn(qn)
    );
    
    initial begin 
    
    $display(" enable | j | K | q | qn ");
    $monitor("%b , %b ,%b , %b , %b " , enable , j , k , q ,qn ) ;
    
    j = 0 ; k = 0 ; enable = 0 ; #10; 
    
    j = 1 ; k = 0 ; enable = 0 ; #10; 
    
    j = 1 ; k = 0 ; enable = 1 ; #10; 
    
    j = 0 ; k = 0 ; enable = 1 ; #10; 
    
    j = 0 ; k = 0 ; enable = 1 ; #10; 
    
    j = 0 ; k = 1 ; enable = 0 ; #10; 
    
    j = 0 ; k = 1 ; enable = 1 ; #10;
    
    j = 0 ; k = 0 ; enable = 1 ; #10;
    
    j = 1 ; k = 0 ; enable = 1 ; #10;
    
    j = 1 ; k = 1 ; enable = 1 ; #10;
    
    j = 1 ; k = 1 ; enable = 1 ; #10;
    
    j = 1 ; k = 1 ; enable = 1 ; #10;
    
    j = 1 ; k = 1 ; enable = 1 ; #10;
    
    $finish; 
    
    end 
     
endmodule
