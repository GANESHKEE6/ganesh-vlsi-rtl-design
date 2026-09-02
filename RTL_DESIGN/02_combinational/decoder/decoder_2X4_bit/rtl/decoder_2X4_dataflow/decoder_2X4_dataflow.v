`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 10:26:13 AM
// Design Name: 
// Module Name: decoder_2X4_dataflow
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


module decoder_2X4_dataflow(
    input x , y , 
    output a , b , c, d 
    );
    
    assign a = (~x & ~y);    
    assign b = (~x & y);    
    assign c = (x & ~y);    
    assign d = (x & y);

endmodule
