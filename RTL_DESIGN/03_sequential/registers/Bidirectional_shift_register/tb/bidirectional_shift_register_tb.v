`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 10:48:56 AM
// Design Name: 
// Module Name: bidirectional_shift_register_tb
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


module bidirectional_shift_register_tb;

    reg [ 3 : 0 ]s_in_left ;
    reg [ 3 : 0 ]s_in_right ;
    reg clk ; 
    reg rst ; 
    reg mode ; 
    
    wire s_out ;
    
    bidirectional_shift_register DUT(
        .s_in_left(s_in_left),
        .s_in_right(s_in_right),
        .clk(clk),
        .rst(rst),
        .mode(mode),
        .s_out(s_out)
    );
    
    initial begin 
        clk = 1 ; 
        forever #5 clk = ~clk ; 
    end
    
    initial begin 
        /*rst = 1 ; 
        mode = 1 ; 
        s_in_left = 4'b1101; #10;
        s_in_right = 4'b1111; #10;
        rst = 0 ; 
        */
        mode = 1 ;
        s_in_left =  1; #10;
        s_in_left =  1; #10;
        s_in_left =  0; #10;
        s_in_left =  1; #10;
        s_in_left =  0; #100;
        
        mode = 0 ;
        s_in_right = 1; #10; 
        s_in_right = 0; #10; 
        s_in_right = 1; #10; 
        s_in_right = 1; #10;
        s_in_right = 0; #100; 
        
        rst = 1 ; #10 ;
        
        $finish ; 
        
    end
        
     
endmodule
