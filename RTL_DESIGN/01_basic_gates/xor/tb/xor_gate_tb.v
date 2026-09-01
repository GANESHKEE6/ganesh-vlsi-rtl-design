`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 10:11:27 AM
// Design Name: 
// Module Name: xor_gate_tb
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


module xor_gate_tb;

    reg a ; 
    reg b ; 
    reg c ;
    
    wire y ;
    
    xor_gate DUT(
    
    .a(a),
    .b(b),
    .c(c),
    .y(y)
    
    );
    
    initial begin 
    
        a = 0 ; b = 0 ; c = 0 ;
        #10 ; 
    
        a = 0 ; b = 0 ; c = 1 ;
        #10 ; 
    
        a = 0 ; b = 1 ; c = 0 ;
        #10 ; 
    
        a = 0 ; b = 1 ; c = 1 ;
        #10 ; 
    
        a = 1 ; b = 0 ; c = 0 ;
        #10 ; 
    
        a = 1 ; b = 0 ; c = 1 ;
        #10 ; 
    
        a = 1 ; b = 1 ; c = 0 ;
        #10 ; 
    
        a = 1 ; b = 1 ; c = 1 ;
        #10 ; 
    
        $finish;
    
    end
   
endmodule
