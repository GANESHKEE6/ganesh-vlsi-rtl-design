`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 09:11:21 AM
// Design Name: 
// Module Name: mux_4X1_tb
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


module mux_4X1_tb;

    reg a ; 
    reg b ; 
    reg c ; 
    reg d ;
    
    //select line
    reg s0 ; 
    reg s1 ; 
    
    //output 
    
    wire y ; 
    
    mux_4X1_dataflow DUT(
        .a(a), 
        .b(b), 
        .c(c), 
        .d(d), 
        .s0(s0),
        .s1(s1),
        .y(y)    
    );
    
    initial begin 
    
    // data line 
    a = 1 ; b = 1 ; c = 0 ; d = 0 ; 
    
    s0 = 0 ; s1 = 0 ; 
    #10 ; 
    
    s0 = 0 ; s1 = 1 ; 
    #10; 
    
    s0 = 1 ; s1 = 0 ; 
    #10;
    
    s0 = 1 ; s1 = 1 ; 
    #10;
    
    $finish; 
    
    end 
     
endmodule
