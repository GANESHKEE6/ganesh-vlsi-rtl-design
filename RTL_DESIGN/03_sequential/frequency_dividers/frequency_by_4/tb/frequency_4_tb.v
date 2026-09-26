`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 03:15:25 PM
// Design Name: 
// Module Name: frequency_4_tb
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


module frequency_4_tb;
    
    reg clk ; 
    reg en ; 
    reg rst ;
    
    wire f_4 ; 
    
    frequency_by_4 DUT(
        clk , rst , en , f_4
        ); 
        
        
    initial begin 
        {clk , rst } = 1 ;
        en = 0 ; 
    end 
    always #5 clk = ~clk ; 
    
    initial begin   
        rst = 1 ; # 10  ; rst = 0 ; 
        
        en = 1 ; 
        
        #200 ; 
        $finish ; 
   end
endmodule
