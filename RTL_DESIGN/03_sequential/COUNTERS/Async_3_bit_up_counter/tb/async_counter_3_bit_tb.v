`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 06:43:15 PM
// Design Name: 
// Module Name: async_counter_3_bit_tb
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

module async_counter_3_bit_tb;
    reg clk;
    reg rst;
    wire [2:0] q;

    // Instantiate the DUT (Device Under Test)
    async_counter_3_bit DUT (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation: 10ns period (toggle every 5ns)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus block
    initial begin
        rst = 1;
        #12;      // Hold reset high past first few clock edges
        rst = 0;  // Release reset, counter starts counting up (ripple style)

        #150;     // Run simulation long enough to observe full count sequence
        $finish;  // Terminate simulation
    end

    // Console monitoring
    initial begin
        $monitor("Time=%0t ns | rst=%b | q=%b (Dec: %0d)", $time, rst, q, q);
    end

endmodule