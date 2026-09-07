`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 09:12:37 AM
// Design Name: 
// Module Name: D_latch_dataflow
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


module D_latch_dataflow(
    input d , 
    output q , qn 
    );
    
    wire n1 ; 
    
    assign n1 = ~d ; 
    
    assign q = ~(d & qn ) ; 
    
    assign qn = ~(n1 & q ) ;
    
endmodule
