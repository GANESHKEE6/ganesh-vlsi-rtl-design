`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 11:46:12 AM
// Design Name: 
// Module Name: nor_gate_tb
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


module nor_gate_tb;

    reg a ; 
    reg b ; 
    wire y ; 
    
    nor_gate DUT(
    .a(a),
    .b(b), 
    .y(y)
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
