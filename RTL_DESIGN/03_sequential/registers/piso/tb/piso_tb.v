`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2026 08:30:33 PM
// Design Name: 
// Module Name: piso_tb
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


module piso_tb;
    reg [3:0]p_in ; 
    reg clk ; 
    reg rst ; 
    
    wire s_out ; 
    
    piso DUT(
        .p_in(p_in), 
        .clk(clk), 
        .rst(rst),
        .s_out(s_out)
    );
    
    initial begin 
    clk = 1 ; 
    forever #5 clk = ~clk ; 
    end 
    
    initial  begin 
    
    rst = 1 ; 
    p_in = 4'b1010 ; #10; 
    rst = 0 ;
    
    p_in = 4'b0101 ; #25 ;
    
    p_in = 4'b0 ; #50 ;
    
    $finish ; 
    
    end
   
endmodule
