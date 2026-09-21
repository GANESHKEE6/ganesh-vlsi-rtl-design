`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2026 07:16:08 PM
// Design Name: 
// Module Name: sipo\
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


module sipo(
    input s_in , clk , rst ,
    output reg [ 3 : 0 ]p_out
    );
    reg  [ 3 : 0 ] temp ;
    
    always @(posedge clk ) begin 
        if(rst)
            temp = 4'b0; 
        else begin 
            temp = temp >> 1 ;
            temp[3] = s_in ; 
        end 
        
        p_out = temp ; 
        
    end
            
        
endmodule

