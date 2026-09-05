`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2026 07:49:26 PM
// Design Name: 
// Module Name: add_sub_5_bit_tb
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


module add_sub_5_bit_tb;
    integer i , j ; 
    reg [ 3 : 0 ] a ; 
    reg [ 3 : 0 ] b ;
    reg ctr ; 
    
    wire [ 3 : 0 ] s ; 
    wire cout ;
    
    add_sub_5_bit DUT(
        .a(a) ,
        .b(b) , 
        .ctr(ctr) , 
        .s(s) , 
        .cout( cout) 
    );
    
    initial begin 
    
        ctr = 0 ; 
        for( i = 0 ; i < 16 ; i = i + 1 )
        begin 
            for( j = 0 ; j < 16 ; j = j +1 )
            begin 
                a = i ; 
                b = j ; 
                #5;
            end
        end        
        $finish ;
    end
endmodule
