`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 09:21:05 AM
// Design Name: 
// Module Name: grey_code_to_binary_behavioral_tb
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


module grey_code_to_binary_behavioral_tb;

    reg g0 ; 
    reg g1 ; 
    reg g2 ; 
    reg g3 ; 
    wire b0 ;
    wire b1 ;
    wire b2 ;
    wire b3 ;
    
    grey_code_to_binary_behavioral DUT(
    
        .g0(g0), 
        .g1(g1),
        .g2(g2),
        .g3(g3),
        .b0(b0),
        .b1(b1), 
        .b2(b2), 
        .b3(b3)
        
    );
    
    initial begin 
    
        g0 = 0 ; g1 = 0 ; g2 = 0 ; g3 = 0 ; #10 ;
        
        g0 = 0 ; g1 = 0 ; g2 = 0 ; g3 = 1 ;  #10 ; 
        
        g0 = 0 ; g1 = 0 ; g2 = 1 ; g3 = 0 ;  #10 ;
        
        g0 = 0 ; g1 = 0 ; g2 = 1 ; g3 = 1 ;  #10 ;
        
        g0 = 0 ; g1 = 1 ; g2 = 0 ; g3 = 0 ;  #10 ;
        
        g0 = 0 ; g1 = 1 ; g2 = 0 ; g3 = 1 ;  #10 ;
        
        g0 = 0 ; g1 = 1 ; g2 = 1 ; g3 = 0 ;  #10 ;
        
        g0 = 0 ; g1 = 1 ; g2 = 1; g3 = 1 ;  #10 ;
        
        g0 = 1 ; g1 = 0 ; g2 = 0 ; g3 = 0 ;  #10 ;
        
        g0 = 1 ; g1 = 0 ; g2 = 0 ; g3 = 1 ;  #10 ;
        
        g0 = 1 ; g1 = 0 ; g2 = 1 ; g3 = 0 ;  #10 ;
        
        g0 = 1 ; g1 = 0 ; g2 = 1 ; g3 = 1 ;  #10 ;
        
        g0 = 1 ; g1 = 1 ; g2 = 0 ; g3 = 0 ;  #10 ;
        
        g0 = 1 ; g1 = 1 ; g2 = 0 ; g3 = 1 ;  #10 ;
        
        g0 = 1 ; g1 = 1 ; g2 = 1 ; g3 = 0 ;  #10 ;
        
        g0 = 1 ; g1 = 1 ; g2 = 1 ; g3 = 1 ;  #10 ;
        
        $finish ; 
        
    end 
        
endmodule
