`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 09:30:50 PM
// Design Name: 
// Module Name: mux_2X1_tb
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


module mux_2X1_tb;

    reg a ; 
    reg b ;
    
    reg s0 ; 
    
    wire y ; 
    
    
    mux_2X1 DUT(
    .a(a), 
    .b(b),
    .s0(s0),
    .y(y)
    );
    
    initial begin 
    
    a = 0 ; b = 0 ; s0 = 0 ; 
    #10 ; 
    
    a = 0 ; b = 1 ; s0 = 1 ; 
    #10 ; 
    
    
    a = 1 ; b = 0 ; s0 = 0 ; 
    #10 ; 
    
    
    a = 1 ; b = 1 ; s0 = 1 ; 
    #10 ; 
    $finish ; 
    
    end
    
endmodule
