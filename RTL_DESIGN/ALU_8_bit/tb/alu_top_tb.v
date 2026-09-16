`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 02:39:17 PM
// Design Name: 
// Module Name: alu_top_tb
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

module alu_top_tb;

    reg [7:0] a;
    reg [7:0] b;
    reg [3:0] sel;

    wire [15:0] y;

    integer i, j, k;

    alu_top DUT (
        .a(a),
        .b(b),
        .sel(sel),
        .y(y)
    );

    initial begin

        for (i = 0; i < 16; i = i + 1) begin

            sel = i;

            for (j = 0; j < 256; j = j + 1) begin

                for (k = 0; k < 256; k = k + 1) begin

                    a = j;
                    b = k;

                    #2;

                end

            end

        end

        $finish;

    end

endmodule