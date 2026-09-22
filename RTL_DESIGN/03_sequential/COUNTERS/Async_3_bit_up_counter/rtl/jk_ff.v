`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2026 06:22:56 PM
// Design Name: 
// Module Name: jk_ff
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

module jk_ff(
    input j , k , clk , rst ,
    output reg q  
    );
    
    always @ ( posedge clk or posedge rst ) begin 
        if(rst)
            q = 1'b0 ;
        else 
            case({j , k })
                2'b00 :
                    begin 
                        q <= 0 ;
                    end 
                2'b01 :
                    begin
                        q <= 0 ; 
                    end
                2'b10 :
                    begin 
                        q <= 1; 
                    end
                2'b11 :
                    begin 
                        q <= ~q ; 
                    end
            endcase 
     end
endmodule