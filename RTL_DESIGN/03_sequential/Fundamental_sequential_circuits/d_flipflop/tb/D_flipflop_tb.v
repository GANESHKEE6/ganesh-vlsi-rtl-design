`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 01:48:06 PM
// Design Name: 
// Module Name: D_flipflop_tb
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


module D_flipflop_tb;

    reg d ; 
    reg clk ; 
    reg reset ; 
    
    wire q ; 
    wire qn ; 
    
    D_flipflop_gatelevel(
        .d(d),
        .clk(clk),
        .reset(reset),
        .q(q),
        .qn(qn)
   );
   
   always #5 clk = ~ clk ;
   
   initial begin 
   
        clk = 1'b0;
        reset = 1'b1 ; 
        d = 1'b0 ;
        
        $monitor("Time=%0t | clk = %b |reset = %b | q = %b | qn = %b " , $time, clk , reset , q ,  qn );
        
        d =  1 ; #10 ; 
        
        d = 0 ; #10 ;
        
        d = 1 ; #10 ; 
        
        reset = 0 ; #10 ; 
        
        $finish ; 
        
  end
  
        
endmodule
