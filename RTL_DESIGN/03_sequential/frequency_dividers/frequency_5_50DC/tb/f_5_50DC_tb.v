`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 05:55:28 PM
// Design Name: 
// Module Name: f_5_50DC_tb
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



module f_5_50DC_tb;

    reg clk  ; 
    reg rst; 
    reg en ;
    
    wire f_5_50dc;
    
    f_5_50DC DUT(
        .clk(clk),
        .rst(rst),
        .en(en),
        .f_5_50dc(f_5_50dc)
       );
       
       initial begin 
            clk = 1 ; 
            rst = 1 ; 
            en = 0 ;
       end
       
       always #5 clk = ~clk ; 
       
       initial begin 
            rst = 1  ; #10 ; rst = 0 ; 
            en = 1 ; 
            #100 ; 
            $finish ; 
       end 
       
endmodule