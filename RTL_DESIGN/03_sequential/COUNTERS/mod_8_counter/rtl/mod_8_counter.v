`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 02:19:22 PM
// Design Name: 
// Module Name: mod_8_counter
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


module mod_8_counter(
    input clk , rst  ,en , 
    output reg [ 2 : 0 ]count 
    );
    
    always @( posedge clk ) begin 
        if ( rst ) 
            count <= 3'h0 ;
        else if ( !en ) 
            count <= count + 1'b1 ; 
        else 
            count <= count ; 
    end 
endmodule
