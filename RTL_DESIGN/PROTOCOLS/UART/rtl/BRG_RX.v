`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2026 01:40:56 PM
// Design Name: 
// Module Name: BRG_RX
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


module BRG_RX (
    input  wire clk,
    input  wire rst,
    output reg  rx_en
);
    reg [9:0] rx_counter;
    
    parameter rx_trigger = 651 ;

 
    always @(posedge clk) begin
        if (rst) begin
            rx_counter <= 10'd0;
            rx_en      <= 1'b0;
        end else if (rx_counter == rx_trigger -1) begin 
            rx_counter <= 0 ;
            rx_en      <= 1'b1;
        end else begin
            rx_counter <= rx_counter + 1'b1;
            rx_en      <= 1'b0;
        end
    end
endmodule