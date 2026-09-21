`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 02:36:17 PM
// Design Name: 
// Module Name: counter_tb
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


module counter_tb;
    reg clk ; 
    reg rst ; 
    wire [2 : 0]count ; 
    
    counter_3_bit_up DUT(
        .clk(clk),
        .rst(rst),
        .count(count)
    );
    
    initial begin 
        clk = 1 ; 
        forever #5 clk = ~clk ;
    end
    
    initial begin 
    rst = 1 ; 
    
    #30 ; 
    
    rst = 0 ; 
    #100 ;
    $finish ; 
    end
endmodule
