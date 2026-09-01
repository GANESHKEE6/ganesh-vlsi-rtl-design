`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 07:28:29 PM
// Design Name: 
// Module Name: nand_behavioral
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


module nand_behavioral(
    input a , b , 
    output reg y 
    );
    
    always @(*)begin
    
         y = ~( a & b) ;
        
    end
    
endmodule
