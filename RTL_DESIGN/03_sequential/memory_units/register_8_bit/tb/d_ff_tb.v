`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2026 11:43:37 AM
// Design Name: 
// Module Name: d_ff_tb
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


module register_8_bit_tb;

    reg [ 7 : 0 ]d ;
    reg rst ; 
    reg clk ; 
    
    wire [ 7 : 0 ] q ; 
    wire [ 7 : 0 ] q_bar ; 
    
    register_8_bit DUT(
        .d(d), 
        .rst(rst), 
        .clk(clk), 
        .q(q), 
        .q_bar(q_bar)
    );
    
    always #5 clk = ~clk ;
    
    initial begin 
        clk = 0; 
        rst = 1; 
        d   = 8'h00;
        
       
        #7 rst = 0; 
        
        #10 d = 8'b10101010; 
        #15 d = 8'b01010101; 
        
        #13 rst = 1 ; 
        
        d = 8'b11101100 ;
        
        #12 rst = 0 ;
        
        #17 d = 8'b01111111;
        
        #20; 
        
         $finish;
    end
        
         
endmodule
