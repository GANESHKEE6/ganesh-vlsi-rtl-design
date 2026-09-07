`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/07/2026 11:31:35 AM
// Design Name: 
// Module Name: JK_flipflop_behavioral
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


module JK_flipflop_behavioral(
    input j , k , enable , 
    output reg q , qn  
    );
   
       
            always @( enable or j or k )begin
            if(enable)begin  
                case({j , k })
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
                        q = ~q ; 
                        qn = ~qn ; 
                    end
                    default :
                        begin 
                            q = 1'bX; 
                            qn = 1'bX;
                        end
                            
                endcase
                
                end
          end
endmodule
