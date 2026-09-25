`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2026 08:23:49 PM
// Design Name: 
// Module Name: piso
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

module piso(
    input [3:0] p_in,
    input clk,
    input rst,
    input load,
    output reg s_out
);

    reg [3:0] temp;

    always @(posedge clk) begin
        if (rst) begin
            temp  <= 4'b0000;
            s_out <= 1'b0;
        end
        else if (load) begin
            temp <= p_in;
        end
        else begin
            s_out <= temp[0];
            temp  <= temp >> 1;
        end
    end

endmodule