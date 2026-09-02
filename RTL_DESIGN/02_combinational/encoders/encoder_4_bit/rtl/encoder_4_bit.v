`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 10:07:50 AM
// Design Name: 
// Module Name: encoder_4_bit
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


module encoder_4_bit_dataflow(
    input a , b , c , d , 
    output x , y 
    );
    
    assign x = ( a | b ) ; 
    assign y = ( a | c ) ;     
    
endmodule
