`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 02:26:51 PM
// Design Name: 
// Module Name: counter_3_bit_up
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


module counter_3_bit_up(
    input clk, rst , 
    output reg[ 2 : 0 ] count 
    );
    
    always@( posedge clk ) begin 
        if ( rst ) begin 
            count = 3'b000;
        end
        else if (count == 3'b111 )begin 
            count = 3'b000 ; 
        end
            
        else begin 
            count = count + 1 ;
        end
    end 
    
endmodule
