`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 03:13:58 PM
// Design Name: 
// Module Name: full_subtractor_tb
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


module full_subtractor_tb;

    reg a ; 
    reg b ; 
    reg cin ; 
    
    wire diff;
    wire borr ; 
    
    full_subtractor_behavioral DUT(
    .a(a), 
    .b(b), 
    .cin(cin),
    .diff(diff), 
    .borr(borr)
    );
    
    initial begin 
    
    a = 0 ; b = 0 ; cin = 0 ; 
    #10;
    
    a = 0 ; b = 0 ; cin = 1 ; 
    #10;
    
    a = 0 ; b = 1 ; cin = 0 ; 
    #10;
    
    a = 0 ; b = 1 ; cin = 1 ; 
    #10;
    
    a = 1 ; b = 0 ; cin = 0 ; 
    #10;
    
    a = 1 ; b = 0 ; cin = 1 ; 
    #10;
    
    a = 1 ; b = 1 ; cin = 0 ; 
    #10;
    
    a = 1 ; b = 1 ; cin = 1 ; 
    #10;
    $finish ; 
    
    end
    
    
endmodule
