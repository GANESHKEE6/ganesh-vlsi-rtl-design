`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2026 09:23:31 AM
// Design Name: 
// Module Name: ram8_8
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


module ram8_8(
    input clk , rst , w_en , 
    input [ 2 : 0 ] w_addr , input  [ 7 : 0 ] d_in ,
    input [ 2 : 0 ]r_addr , 
    output reg [ 7 : 0 ] d_out 
    );
    
    reg [ 7 : 0 ] mem[7 : 0] ;
    integer i ; 
    always@( posedge clk  or posedge  rst)
        begin 
            if(rst)begin 
                for( i = 0 ; i <+ 7 ; i = i + 1 ) 
                    mem[i] <= 0  ;
            end
            else    
                if( w_en)
                   mem[ w_addr] <= d_in ;
                else if( w_en == 0 )
                   d_out <= mem[ r_addr ];
            end
            
endmodule
