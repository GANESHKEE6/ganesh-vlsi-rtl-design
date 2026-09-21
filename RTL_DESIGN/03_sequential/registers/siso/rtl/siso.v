`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2026 10:31:42 PM
// Design Name: 
// Module Name: siso
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


module siso(
    input s_in , clk , rst , 
    output reg s_out 
    );
    
    reg [ 3 : 0 ]temp ; 
    
    always @( posedge clk ) begin 
        
        if( rst ) 
            temp = 4'b0 ; 
        else begin 
        temp = temp >> 1 ; 
        temp[3] = s_in ;  
        s_out = temp[0] ;
        end
    end
    
endmodule
