`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 01:56:59 PM
// Design Name: 
// Module Name: mod_4_counter
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


module mod_4_counter(
    input clk , rst , en  ,
    output reg [ 1 : 0 ] count 
    );
    
always @( posedge  clk ) begin 
    if( rst ) 
        count <= 2'b00 ; 
    else if ( en) 
        count = count + 1'b1 ; 
    else 
        count <= count ;
end 
         
endmodule
