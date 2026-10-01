`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2026 09:34:06 AM
// Design Name: 
// Module Name: ram8_8_tb
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


module ram8_8_tb;

    reg clk ;
    reg rst ; 
    reg w_en ; 
    reg [2 : 0] w_addr ;
    reg [7 : 0] d_in ; 
    reg [2 : 0]r_addr ;
    wire [ 7 : 0 ] d_out ;
    
    // ram instanciation 
    
    ram8_8 DUT(
        clk , rst , w_en , w_addr , d_in ,r_addr , d_out 
        );
        
        
    initial begin 
        clk = 0 ; 
        rst = 0 ;
        w_en = 0 ; 
    end
    
    always #5 clk = ~clk ;
    
    initial begin 
        rst = 1 ; // rst for 10 ns
        #10  ; 
        rst = 0 ; 
        
        w_en = 1 ;
        w_addr = 3'b000 ; 
        d_in = 8'b11111111;
        
        #10; 
        
        w_en = 0 ; 
        r_addr = 3'b000 ;
        
        #10 ; 
        
        w_en = 1 ;
        w_addr = 3'b011 ; 
        d_in = 8'b11110000;
        
        #10 ; 
        
        w_en = 0 ; 
        r_addr= 3'b011 ;
        
        #10 ; 
        $finish ; 
    end 
endmodule


