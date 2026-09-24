`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 02:04:13 PM
// Design Name: 
// Module Name: mod_4_tb
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


module mod_4_tb;

    reg clk ; 
    reg rst ; 
    reg en ; 
    
    wire [ 1 : 0 ] count ; 
    
    mod_4_counter DUT( 
        clk , rst , en , count 
        );
        
    initial begin 
        { clk , rst } = 1 ;
        en = 0 ;  
    end 
    
    always # 5 clk = ~clk ; 
    
    initial begin 
        rst = 1 ;  #10 ; rst = 0 ; 
        en = 1 ; 
        #100 ;
        $finish ; 
    end 
    
endmodule
