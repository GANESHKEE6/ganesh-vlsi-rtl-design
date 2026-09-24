`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 02:22:22 PM
// Design Name: 
// Module Name: mod_8_tb
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


module mod_8_tb;

    reg clk ; 
    reg rst ; 
    reg en ;
    
    wire [ 2 : 0 ] count ; 
    
    mod_8_counter DUT(
        clk , rst , en , count 
        ); 
        
    initial begin 
        { clk , rst , en } = 1 ;
    end 
    
    always # 5 clk = ~clk ;

    initial begin 
        rst = 1 ; #20 ; rst = 0 ;
        en = 0 ;
        #165 ; 
        $finish ; 
    end 
endmodule
