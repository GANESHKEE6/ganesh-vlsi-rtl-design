`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 02:29:14 PM
// Design Name: 
// Module Name: half_subtractor_tb
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


module half_subtractor_tb;

    reg a ; 
    reg b ; 
    
    wire diff ; 
    wire borrow ; 
    
    half_subtractor_dataflow DUT(
    .a(a), 
    .b(b), 
    .diff(diff), 
    .borrow(borrow)
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
        $finish ; 
        
    end
    
endmodule
