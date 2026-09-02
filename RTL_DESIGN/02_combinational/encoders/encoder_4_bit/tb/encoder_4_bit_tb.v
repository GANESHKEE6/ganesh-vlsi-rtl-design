`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 10:12:04 AM
// Design Name: 
// Module Name: encoder_4_bit_tb
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


module encoder_4_bit_tb;

    reg a ; 
    reg b ; 
    reg c ; 
    reg d ; 
    
    wire x ; 
    wire y ; 
    
    encoder_4_bit_dataflow DUT(
        .a(a),
        .b(b), 
        .c(c),
        .d(d),
        
        .x(x),
        .y(y)
        
    );
    
    initial begin 
    
        a = 0 ; b = 0 ; c = 0 ; d = 1 ; 
        #10;
        
        a = 0 ; b = 0 ; c = 1 ; d = 0 ; 
        #10;
        
        a = 0 ; b = 1 ; c = 0 ; d = 0 ; 
        #10;
        
        a = 1 ; b = 0 ; c = 0 ; d = 0 ; 
        #10;
        
        $finish;
        
    end
    
        
 
                
endmodule
