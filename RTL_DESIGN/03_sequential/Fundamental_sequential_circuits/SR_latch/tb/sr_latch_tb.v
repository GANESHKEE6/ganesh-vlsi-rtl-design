`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2026 07:23:39 PM
// Design Name: 
// Module Name: sr_latch_tb
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


module sr_latch_tb;
    reg s ; 
    reg r ; 
    
    wire q ; 
    wire qn ; 
    
    sr_latch_behavioral DUT(
        .s(s), 
        .r(r),
        .q(q), 
        .qn(qn)
    );
    
    initial begin 
    
    
        $display( " time \t s r | q qn " ) ; 
        $display("___________________ ");
        $monitor("%0t\t %b %b | %b  %b", $time, s , r , q , qn);
        
        s = 0 ; r = 0 ; #10 ; 
        
        s = 1 ; r = 0 ; #10;
        
        s = 0 ; r = 0 ; #10; 
        
        s = 0 ; r = 1 ; #10;
        
        s = 0 ; r = 0 ; #10;
        
        
        s = 0 ; r = 0 ; #10;
        
        s = 1 ; r = 1 ; #10;
        
        s = 0 ; r = 0 ; #10;
        
        $finish ;
        
    end
 
endmodule
