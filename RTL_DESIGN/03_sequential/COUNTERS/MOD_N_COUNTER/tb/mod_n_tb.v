`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 02:42:47 PM
// Design Name: 
// Module Name: mod_n_tb
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


module mod_n_tb;

    // Parameters
    parameter N = 10;
    parameter width = 4;

    // Testbench signals
    reg clk;
    reg rst;
    wire [width-1:0] out;

    // Instantiate DUT
    mod_n_counter #(
        .N(N),
        .width(width)
    ) dut (
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin

        // Initialize
        clk = 0;
        rst = 1;

        // Display values
        $monitor("Time = %0t | Reset = %b | Count = %d",
                  $time, rst, out);

        // Keep reset active
        #10;

        // Release reset
        rst = 0;

        // Run counter
        #120;

        // Apply reset again
        rst = 1;
        #10;

        // Release reset again
        rst = 0;
        #30;

        // End simulation
        $finish;

    end

endmodule
