`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 09:22:18 AM
// Design Name: 
// Module Name: D_latch_tb
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


module D_latch_tb;

    reg d ; 
    
    wire q ; 
    wire qn ;
    
    D_latch_behavioral DUT(
        .d(d), 
        .q(q), 
        .qn(qn)
    );
    
    initial 
    begin 
    
        $display(" D | q qn ");
        d = 0 ; #10;
        d = 1 ; #10; 
        d= 1 ; #10 ;
        $finish ; 
        
    end 
        
endmodule
