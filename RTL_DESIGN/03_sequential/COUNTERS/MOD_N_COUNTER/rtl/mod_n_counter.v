`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 02:33:59 PM
// Design Name: 
// Module Name: mod_n_counter
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


module mod_n_counter
    #( parameter N = 10 , parameter width = 4 ) 
   (
   input clk , rst , output reg [ width - 1 : 0 ] out 
    );
    
    always@(posedge clk ) begin 
        if (rst) 
            out <= 0 ;
        else if( out == N-1) 
                out <= 0 ; 
        else    
            out = out + 1 ;
   end
endmodule
