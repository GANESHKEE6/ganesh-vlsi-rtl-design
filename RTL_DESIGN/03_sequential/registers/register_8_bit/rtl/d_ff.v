`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2026 11:03:32 AM
// Design Name: 
// Module Name: d_ff
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


module d_ff(
    input d , rst , clk , 
    output reg q , 
    output q_bar
    );
    assign q_bar = ~q ; 
    
    always @(posedge clk)begin 
        if(rst)
            q <= 0 ; 
        else
            q <= d ;
    end
    
endmodule
