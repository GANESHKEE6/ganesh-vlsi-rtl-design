`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 09:17:32 AM
// Design Name: 
// Module Name: D_latch_behavioral
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


module D_latch_behavioral(
    input d , 
    output reg q , reg qn 
    );
    
    always @ ( d )
        begin
            q = d ; 
            qn = ~d ; 
        end
        
endmodule
