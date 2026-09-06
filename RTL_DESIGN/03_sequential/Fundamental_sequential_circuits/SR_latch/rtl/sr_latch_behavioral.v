`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2026 07:04:20 PM
// Design Name: 
// Module Name: sr_latch_behavioral
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


module sr_latch_behavioral(
    input s ,r ,
    output reg q , qn 
    );
    
    always @ ( s or r ) 
        begin
            case({ s , r } )
                2'b00:
                    begin
                        q = q ; 
                        qn = qn ; 
                    end 
                2'b01:
                    begin
                        q = 0 ;
                        qn = 1 ;
                    end 
                2'b10:
                    begin
                        q = 1 ; 
                        qn = 0 ;
                    end 
                2'b11:
                    begin
                        q = 1'bx ; 
                        qn = 1'bx ; 
                    end 
                default:
                    begin
                        q = 1'bx ;
                        qn = 1'bx ;
                    end
            endcase 
     end
     
endmodule
