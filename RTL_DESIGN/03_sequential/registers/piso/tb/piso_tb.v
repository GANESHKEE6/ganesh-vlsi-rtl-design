`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2026 08:30:33 PM
// Design Name: 
// Module Name: piso_tb
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

`timescale 1ns / 1ps

module piso_tb;

    reg [3:0] p_in;
    reg clk;
    reg rst;
    reg load;
    wire s_out;

    // DUT
    piso uut (
        .p_in  (p_in),
        .clk   (clk),
        .rst   (rst),
        .load  (load),
        .s_out (s_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Initial values
        clk  = 0;
        rst  = 1;
        load = 0;
        p_in = 4'b0000;

        // Reset
        #10;
        rst = 0;

        // Parallel load
        p_in = 4'b1011;
        load = 1;

        #10;

        // Start shifting
        load = 0;

        // 4 shift cycles
        #40;

        // Finish simulation
        $finish;
    end

    // Monitor
    initial begin
        $monitor("Time = %0t | rst = %b | load = %b | p_in = %b | temp = %b | s_out = %b",
                 $time, rst, load, p_in, uut.temp, s_out);
    end

endmodule