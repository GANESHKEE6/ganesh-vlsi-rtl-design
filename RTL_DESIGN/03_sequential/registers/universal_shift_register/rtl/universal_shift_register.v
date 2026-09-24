`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 01:29:37 PM
// Design Name: 
// Module Name: universal_shift_register
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


module universal_shift_register(
    input clk , rst , load , shift , s_in , 
    input [ 1 : 0 ]mode , 
    input [ 3 : 0 ]p_in , 
    output s_out , 
    output [ 3 : 0 ] p_out 
    );
    
    reg [ 3 : 0 ]temp ;
    
    always@(posedge clk)begin 
        if(rst)
            temp <= 4'b0000;
        else begin 
        case(mode)
            2'b00:begin //siso
                if(shift)
                    temp <= {s_in,temp[3:1]};
                else
                    temp <= temp ; 
            end
            
            2'b01 : begin  /// sipo
                if(shift)
                    temp <= {s_in,temp[3:1]};
                else
                    temp <= temp ;
            end
            
            2'b10 : begin 
                if(load)
                    temp <= p_in ; 
                else
                    temp <= {s_in,temp[3:1]};
            end
            
            2'b11 : begin 
                if( load )
                    temp <= p_in ; 
                else 
                    temp <= temp ;
            end
            
            default  : temp <= temp ;
         
        endcase 
        end
        
        end 
        
        assign s_out = temp[0]; 
        assign p_out = ( shift == 0 && load == 0 ) ? temp : 1'bx ; 
        
                   
endmodule

