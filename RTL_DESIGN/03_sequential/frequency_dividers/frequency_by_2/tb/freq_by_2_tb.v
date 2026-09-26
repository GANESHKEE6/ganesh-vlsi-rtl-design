`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 02:56:15 PM
// Design Name: 
// Module Name: freq_by_2_tb
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


module freq_by_2_tb;
    reg clk ; 
    reg rst ; 
    
    wire f_2 ; 
    
    freq_by_2 DUT(
        clk , rst , f_2
        );
        
   initial begin 
        {clk , rst } = 1 ; 
   end
   always # 5 clk = ~clk ; 
   initial begin 
    rst = 1 ; # 10 ; rst = 0 ; 
    #100 ;
   end
    
endmodule
