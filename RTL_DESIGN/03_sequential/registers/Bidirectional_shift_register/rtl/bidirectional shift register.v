`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 10:35:02 AM
// Design Name: 
// Module Name: bidirectional shift register
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


module bidirectional_shift_register(
    input  s_in_left ,
    input  s_in_right , 
    input mode ,
    input rst , 
    input clk , 
    output reg s_out
    );
    
    reg [ 3 : 0 ] temp ; 
    
    always @ ( posedge clk )begin 
    
    if( rst ) 
        temp <= 4'b0000 ; 
    else if( mode == 1'b1 )begin 
        temp = temp >> 1 ; // right shift 
        temp[ 3 ] = s_in_left ;
        s_out = temp[ 0 ] ;
    end
    else begin 
        temp = temp << 1 ; // left shift 
        temp[ 0 ] = s_in_right ; 
        s_out = temp[3] ;
    end
    end
endmodule
