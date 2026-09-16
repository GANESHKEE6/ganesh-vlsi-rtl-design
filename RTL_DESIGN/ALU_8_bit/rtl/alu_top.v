`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 01:39:03 PM
// Design Name: 
// Module Name: alu_top
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


module alu_top(
    input wire [ 7 : 0 ] a , 
    input wire[ 7 : 0 ] b , 
    input wire[ 3 : 0 ] sel, 
    
    output reg [15 : 0] y

    );
    /// arithemetic operation
    wire [15 : 0 ] add_result ;
    wire [15 : 0 ] sub_result ; 
    wire [15 : 0 ] mul_result ; 
    wire [15 : 0 ] div_result ;
    wire [ 15 : 0 ] left_shift ; 
    wire [ 15 : 0 ] right_shift ; 
    wire [ 15 : 0 ] increment ; 
    wire [ 15 : 0 ] decrement ; 
    
    /// logical operation 
    
    
    wire  [15 : 0 ] and_result; 
    wire [ 15 : 0 ] nand_result ; 
    wire [ 15 : 0 ] or_result ; 
    wire [ 15 : 0 ] nor_result ; 
    wire [ 15 : 0 ] xor_result ; 
    wire [ 15 : 0 ] xnor_result ;  
    wire [ 15 : 0 ] not_result ; 
    wire [ 15 : 0 ] pass_result ; 
    
    
    ///// adder instantiation //////////
    au_add_8_bit adder(
        .a(a),
        .b(b),
        .cin(1'b0),
        .y(add_result)
    );
    
    /////////subtractor instantiation /////
    
    au_sub_8_bit subtractor(
        .a(a), 
        .b(b), 
        .cin(1'b0),
        .y(sub_result) 
    );
    
    au_mul_8_bit multiplier(
        .a(a), 
        .b(b), 
        .y(mul_result)
    );
    
    au_div_8_bit divider(   
        .a(a) ,
        .b(b) , 
        .y(div_result)
    );
    
    au_left_shift_8_bit left_shifter(
        .a(a), 
        .y(left_shift) 
    );
    
    au_right_shift_8_bit right_shifter(
        .a(a) , 
        .y(right_shift)
    );
    
    au_increment_8_bit incrementer(
        .a(a) , 
        .y(increment) 
    );
    
    au_decrement_8_bit decrementer(
        .a(a), 
        .y(decrement)
    );
    
    lu_and_8_bit and_opr(
        .a(a), 
        .b(b), 
        .y(and_result)
    ); 
    
    lu_nand_8_bit nand_opr(
        .a(a),
        .b(b),
        .y(nand_result)
     );
     
     lu_or_8_bit or_opr(
        .a(a),
        .b(b),
        .y(or_result)
    );
    
    lu_nor_8_bit nor_opr(
        .a(a) , 
        .b(b), 
        .y(nor_result)
    );
    
    lu_xor_8_bit xor_opr(
        .a(a),
        .b(b), 
        .y(xor_result)
    ); 
    
    lu_xnor_8_bit xnor_opr(
        .a(a), 
        .b(b), 
        .y(xnor_result)
     );
     
     lu_not_8_bit not_opr(
        .a(a), 
        .y(not_result)
     );
     
     lu_pass_8_bit pass_opr(
        .a(a), 
        .y(pass_result)
     );
     
     always @ (*) begin 
        y = 16'b0000;
        
        case(sel)
        
        4'b0000 : begin
            y = add_result ; 
        end
        
        4'b0001 : begin 
            y = sub_result ; 
        end
        
        4'b0010 : begin 
            y = mul_result ; 
        end
        
        4'b0011 : begin
            y = div_result ; 
        end 
        
        4'b0100 : begin 
            y = left_shift ; 
        end 
        
        4'b0101 : begin 
            y = right_shift ; 
        end 
        
        4'b0110 : begin 
            y = increment ;
        end
        
        4'b0111 : begin 
            y = decrement ; 
        end 
        
        4'b1000 : begin 
            y = and_result ;
        end 
        
        4'b1001 : begin 
            y = nand_result ; 
        end 
        
        4'b1010 : begin 
            y = or_result ; 
        end 
        
        4'b1011 : begin 
            y = nor_result ; 
        end 
         
        4'b1100 : begin 
            y = xor_result ; 
        end 
        
        4'b1101 : begin 
            y = xnor_result ; 
        end 
        
        4'b1110 : begin 
            y = not_result ; 
        end 
        
        4'b1111 : begin 
            y = pass_result ; 
        end
   endcase 
   
   end
    
    
endmodule
