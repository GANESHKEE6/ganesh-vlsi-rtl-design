`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2026 08:00:13 PM
// Design Name: 
// Module Name: binary_to_grey_code_dataflow
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


module binary_to_grey_code_dataflow(
    input b0 , b1 , b2 , b3 , 
    output g0 , g1 , g2 , g3 
    );
    
    assign g0 = b0 ;
    
    exor_gate_gatelevel xor_1(
    .a(b0),
    .b(b1),
    .y(g1)
    );
    
    exor_gate_gatelevel xor_2(
    .a(b2),
    .b(b1),
    .y(g2)
    );
    
    exor_gate_gatelevel xor_3(
    .a(b3),
    .b(b2),
    .y(g3)
    );
    
endmodule
