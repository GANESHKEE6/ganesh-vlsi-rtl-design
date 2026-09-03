`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 11:35:43 AM
// Design Name: 
// Module Name: comparator_2_bit_tb
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


module comparator_2_bit_tb;
    reg a ;
    reg b ;
    
    wire l ;
    wire e ;
    wire g ;
    
    comparator_2_bit_dataflow DUT(
        .a(a),
        .b(b),
        
        .l(l),
        .e(e),
        .g(g)
        
    );
    
    initial begin 
    
    a = 0 ; b = 0 ; 
    #10;
    
    a = 0 ; b = 1 ; 
    #10; 
    
    a = 1 ; b = 0 ; 
    #10;
    
    a = 1 ; b = 1 ; 
    #10;
    
    $finish;
    
    end
    
endmodule
