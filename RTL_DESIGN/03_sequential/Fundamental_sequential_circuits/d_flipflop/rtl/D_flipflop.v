`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 01:28:04 PM
// Design Name: 
// Module Name: D_flipflop
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


module D_flipflop_gatelevel(
    input d , reset , clk ,
    output reg q , qn  
   );
   
   always @ (posedge clk) begin 
        if(reset)begin 
            q <= d ; 
            qn <= ~q ; 
        end
   end
   
endmodule
