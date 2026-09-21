`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 08:47:16 AM
// Design Name: 
// Module Name: pipo
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


module pipo(
    input [ 3 : 0 ]p_in ,
    input clk , rst , 
    output reg [3 : 0 ]p_out 
    );
    
    reg [3 : 0]temp ;
    
    always @(posedge clk)begin
        if(rst)
            temp = 4'b0000;
        else begin 
            p_out = p_in ;
        end
    end
endmodule
