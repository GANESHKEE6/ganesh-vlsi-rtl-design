`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 10:32:03 AM
// Design Name: 
// Module Name: decoder_2X4_tb
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


module decoder_2X4_tb;

    reg x ; 
    reg y ; 
    
    wire a ; 
    wire b ; 
    wire c ;
    wire d ;
    
    
    decoder_2X4_dataflow DUT(
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .x(x),
        .y(y)
    );
    
    initial begin 
        
        x = 0 ;  y = 0 ; 
        #10 ; 
        
        x = 0 ;  y = 1 ; 
        #10 ; 
        
        x = 1 ;  y = 0 ; 
        #10 ; 
        
        x = 1 ;  y = 1 ; 
        #10 ; 
        $finish ; 
        
    end
        
endmodule
