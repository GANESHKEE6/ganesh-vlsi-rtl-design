`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/02/2026 11:29:47 AM
// Design Name: 
// Module Name: comparator_2_bit_dataflow
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


module comparator_2_bit_dataflow(
    input a , b ,
    output l , e , g 
    );
    
    assign l = ( ~a & b ) ;
    assign e = (  a ~^ b );
    assign g = ( a & ~b) ;
    
endmodule
