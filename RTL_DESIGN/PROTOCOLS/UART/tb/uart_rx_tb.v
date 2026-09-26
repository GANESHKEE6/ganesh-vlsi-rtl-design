`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2026 02:41:14 PM
// Design Name: 
// Module Name: uart_rx_tb
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

module uart_rx_tb;

    reg clk;
    reg rst;
    reg rx;
    wire [7:0] d_out;
    wire rdy;

    // Instantiate Top Module
    uart_rx_top uut (
        .clk(clk),
        .rst(rst),
        .rx(rx),
        .d_out(d_out),
        .rdy(rdy)
    );

    // 100 MHz Clock Generator (10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        rx  = 1; // Idle state is HIGH

        // Apply Reset
        #100;
        rst = 0;
        #200;

        // ==================================================
        // Transmit 1st Byte: 8'hA5 (Binary: 10100101, LSB first)
        // ==================================================
        // Start Bit
        rx = 1'b0; #104160;

        // Data Bits
        rx = 1'b1; #104160; // Bit 0 (LSB)
        rx = 1'b0; #104160; // Bit 1
        rx = 1'b1; #104160; // Bit 2
        rx = 1'b0; #104160; // Bit 3
        rx = 1'b0; #104160; // Bit 4
        rx = 1'b1; #104160; // Bit 5
        rx = 1'b0; #104160; // Bit 6
        rx = 1'b1; #104160; // Bit 7 (MSB)

        // Stop Bit
        rx = 1'b1; #104160;

        // Wait for receiver ready flag
        @(posedge rdy);
        #1000;

        // ==================================================
        // Transmit 2nd Byte: 8'h3C (Binary: 00111100, LSB first)
        // ==================================================
        // Start Bit
        rx = 1'b0; #104160;

        // Data Bits
        rx = 1'b0; #104160; // Bit 0 (LSB)
        rx = 1'b0; #104160; // Bit 1
        rx = 1'b1; #104160; // Bit 2
        rx = 1'b1; #104160; // Bit 3
        rx = 1'b1; #104160; // Bit 4
        rx = 1'b1; #104160; // Bit 5
        rx = 1'b0; #104160; // Bit 6
        rx = 1'b0; #104160; // Bit 7 (MSB)

        // Stop Bit
        rx = 1'b1; #104160;

        // Wait for receiver ready flag
        @(posedge rdy);
        #5000;

        $finish;
    end

endmodule