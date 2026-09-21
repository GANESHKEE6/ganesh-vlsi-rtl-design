`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 08:55:08 AM
// Design Name: 
// Module Name: pipo_tb
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


module pipo_tb;

    reg [ 3 : 0 ]p_in ; 
    reg clk ; 
    reg rst ; 
    
    wire [ 3 : 0 ] p_out ; 
    
    pipo DUT(
        .p_in(p_in),
        .clk(clk), 
        .rst(rst), 
        .p_out(p_out)
    );
    
    initial begin 
    clk = 1 ; 
    forever #5 clk = ~ clk ; 
    end 
    initial begin 
    rst = 1 ;
    p_in = 4'b1111; # 10 ;
    rst = 0 ;
    
    p_in = 4'b1010 ; #13 ; 
    
    p_in = 4'b0101 ; #10 ;
    $finish ; 
    
    end
endmodule
