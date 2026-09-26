`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 06:06:35 PM
// Design Name: 
// Module Name: freq_15
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


module freq_15(
    input clk , rst , en , 
    output f_15
    );
    
    reg [ 2 : 0 ] count ; 
    reg en1 ;
    reg en2 ; 
    
    always@(posedge clk ) begin 
        if( rst ) begin 
            count <= 0 ; 
            en1 <= 0 ;
            en2 <= 0 ;
        end
        
        else
            if(en && count == 2 ) 
                count <= 0 ;
            else if ( en && count < 2 ) 
                count = count + 1'b1 ; 
    end 
    
    always @(posedge clk ) 
        begin 
            if( count == 2 ) 
                en1 <= 1'b1 ;
            else 
                en1 <= 1'b0 ; 
    end
    
    always @( negedge  clk )
        begin 
            if( count == 1 ) 
                en2 <= 1'b1 ; 
            else 
                en2 <= 1'b0 ;
    end
    
    assign f_15 = en1^en2 ;
 
endmodule
