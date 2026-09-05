`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 08:45:32 PM
// Design Name: 
// Module Name: bcd_xs3_converter_tb
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


module bcd_xs3_converter_tb;
    integer i ;
    reg [3:0] a;
    wire [3:0] xs3 ;
    
    bcd_xs3_converter DUT(
        .a(a),
        .xs3(xs3)
    );
    
    initial begin 
        
        for ( i = 0 ; i < 16 ; i = i + 1 )
        begin
            a = i ; 
            #10;
        end 
        $finish; 
        
     end 
        
endmodule
