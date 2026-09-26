`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 03:09:08 PM
// Design Name: 
// Module Name: frequency_by_4
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


module frequency_by_4(
    input clk , rst , en ,
    output f_4 
    );
    
    reg [ 1 : 0 ]count ; 
    
    always @( posedge clk ) begin 
        if( rst ) 
            count <= 2'b00 ; 
        else if ( en ) 
            count <= count + 1'b1 ;
        else 
            count <= count ;
    end
    
    assign f_4 = count[1] ;
    
endmodule
