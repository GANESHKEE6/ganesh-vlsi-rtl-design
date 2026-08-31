`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 06:36:45 PM
// Design Name: 
// Module Name: not_gate_tb
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


module not_gate_tb;

    reg a ;
    wire y ; 
    
    not_gate DUT(
    .a(a),
    .y(y)
    );
    
    initial begin 
    
        a = 1 ; 
        #10;
    
        a = 0 ; 
        #10;
    
        $finish;
    
    end
    
    initial begin 
        $monitor("Time=%0t | Input a=%b | Output y=%b" ,$time,a,y);
    end
    
endmodule     
    