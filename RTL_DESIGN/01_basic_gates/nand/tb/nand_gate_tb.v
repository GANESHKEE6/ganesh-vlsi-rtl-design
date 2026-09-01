`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 07:33:01 PM
// Design Name: 
// Module Name: nand_gate_tb
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


module nand_gatelevel_tb;

    reg  a ;
    reg b ;
    wire y ; 
    
    nand_gatelevel DUT(
    .a(a),
    .b(b),
    .y(y)
    );
    
    initial begin
    
    a = 0 ; b = 0;
    #10;
    
    a = 0 ; b = 1 ; 
    #10 ;
    
    a = 1 ; b = 0 ; 
    #10 ; 
    
    a =1 ; b = 1 ; 
    #10 ;
    
    end
    
    initial begin
        $monitor("Time=%0t | Input a=%b | Output y=%b", $time, a, y);
    end
endmodule
