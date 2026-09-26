`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 06:15:42 PM
// Design Name: 
// Module Name: f_15_tb
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


module f_15_tb;

    reg clk ; 
    reg rst ; 
    reg en ; 
    
    wire f_15 ; 
    
    freq_15 DUT(
        .clk(clk),
        .rst(rst),
        .en(en),
        .f_15(f_15)
    );
    
    initial begin   
        clk = 1; 
        en = 0 ; 
        rst = 1 ;
    end
    
    always #5 clk = ~clk ; 
    
    initial begin 
        rst = 1 ; #10 ; rst = 0 ; 
        
        en = 1 ; 
        
        #100 ; 
        
        $finish ; 
    end
    
endmodule
