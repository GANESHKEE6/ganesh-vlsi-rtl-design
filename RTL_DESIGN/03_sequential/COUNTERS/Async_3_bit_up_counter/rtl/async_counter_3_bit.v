`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 06:24:13 PM
// Design Name: 
// Module Name: async_counter_3_bit
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


module async_counter_3_bit(
    input [ 2 : 0 ] j , k , 
    input clk , rst , 
    output [ 2 : 0 ] q 
    );
    
    wire w1 , w2 , w3 ; 
    
    jk_ff jk_0(
        .j(1'b1),
        .k(1'b1),
        .clk(clk),
        .rst(rst),
        .q(w1)
    );
    
    jk_ff jk_1(
        .j(1'b1),
        .k(1'b1),
        .clk(w1),
        .rst(rst),
        .q(w2)
    );
    
    jk_ff jk_2(
        .j(1'b1),
        .k(1'b1),
        .clk(w2),
        .rst(rst),
        .q(w3)
    );
    

    
    assign q= {w3,w2,w1} ;
   
    
endmodule
