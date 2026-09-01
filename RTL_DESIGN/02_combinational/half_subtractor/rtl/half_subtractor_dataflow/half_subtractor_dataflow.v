`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 02:16:57 PM
// Design Name: 
// Module Name: half_subtractor_dataflow
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

module half_subtractor_dataflow (
    input wire a,
    input wire b,
    output wire difference,
    output wire borrow
);

    // Difference is a XOR b
    assign diff = a ^ b;
    
    // Borrow is (NOT a) AND b
    assign borrow = ~a & b;

endmodule