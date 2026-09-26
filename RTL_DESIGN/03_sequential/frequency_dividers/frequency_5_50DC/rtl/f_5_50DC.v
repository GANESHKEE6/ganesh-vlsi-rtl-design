`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2026 05:54:02 PM
// Design Name: 
// Module Name: f_5_50DC
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


module f_5_50DC(
    input clk , rst , en , 
    output f_5_50dc
    );
    
    reg [ 4 : 0 ] count ; 
    reg en1 ; 
    reg en2 ;
    
    always @( posedge clk ) begin 
        if(rst)begin 
            count <= 0 ; 
            en1 <= 0 ; 
            en2 <= 0 ;
        end 
        else
            if( en && count == 4 ) 
                count <= 0 ; 
            else if ( en && count < 4 ) 
                count <= count + 1'b1; 
        end 

    
    always @(posedge clk ) begin 
        if( count == 0  || count == 1 )
            en1 <= 1'b1 ;
        else
            en1 <= 1'b0 ; 
    end
    
    always @(negedge clk ) begin 
        if( count == 0 || count == 1 )
            en2 <= 1'b1;
        else
            en2 <= 1'b0 ;
    end
    
    assign f_5_50dc = en1 | en2 ; 
        
    
endmodule