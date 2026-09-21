`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2026 07:45:58 PM
// Design Name: 
// Module Name: sipo_tb
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


module sipo_tb;
    reg s_in ; 
    reg clk ; 
    reg rst ; 
    wire p_out ; 
    
    sipo DUT(
        .s_in(s_in),
        .clk(clk),
        .rst(rst),
        .p_out(p_out)
    );
    
    initial begin
        clk = 1;
        forever  #5 clk = ~clk ;
    end 
    
    initial begin
        rst = 1 ; 
        
        s_in = 1 ; # 10 ; 
        
        rst = 0 ; 
        
        s_in = 1 ; #10;
        
        s_in = 1 ; #10;
        
        s_in = 0 ; #10;
        
        s_in = 0 ; #10;
        
        s_in = 0 ; #50;
        
        $finish ;
    end   
endmodule
