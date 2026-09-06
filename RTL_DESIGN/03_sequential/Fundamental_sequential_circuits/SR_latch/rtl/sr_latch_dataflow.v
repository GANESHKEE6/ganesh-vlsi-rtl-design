`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2026 07:00:03 PM
// Design Name: 
// Module Name: sr_latch_dataflow
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


module sr_latch_dataflow(
    input s , r, 
    output  q , qn 
    );
    
    assign q = ~( s & qn )  ;
    
    assign qn = ~( r & q ) ; 
    
endmodule
