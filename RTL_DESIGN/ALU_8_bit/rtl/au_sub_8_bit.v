`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2026 10:34:48 AM
// Design Name: 
// Module Name: au_sub_8_bit
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


module au_sub_8_bit(
    input [ 7 : 0 ] a , 
    input [ 7 : 0 ] b , 
    input cin , 
    output [ 7 : 0 ] diff , 
    output bo
    );
    
    wire b0 , b1 , b2 , b3 , b4 , b5 , b6 ,b7 ;
    
    full_subtractor fs_0(
        .a(a[0]), 
        .b(b[0]), 
        .cin(cin), 
        .d(diff[0]),
        .bi(b0)
    );
    
    full_subtractor fs_1(
        .a(a[1]),
        .b(b[1]), 
        .cin(b0), 
        .d(diff[1]), 
        .bi(b1)
    );
    
    full_subtractor fs_2(
        .a(a[2]), 
        .b(b[2]),
        .cin(b1), 
        .d(diff[2]),
        .bi(b2)
    );
    
    full_subtractor fs_3(
        .a(a[3]), 
        .b(b[3]),
        .cin(b2), 
        .d(diff[3]), 
        .bi(b3)
    );
    
    full_subtractor fs_4(
        .a(a[4]),
        .b(b[4]), 
        .cin(b3), 
        .d(diff[4]), 
        .bi(b4)
    );
    
    full_subtractor fs_5(
        .a(a[5]),
        .b(b[5]), 
        .cin(b4), 
        .d(diff[5]), 
        .bi(b5)
    );
    
    full_subtractor fs_6(
        .a(a[6]), 
        .b(b[6]), 
        .cin(b5), 
        .d(diff[6]), 
        .bi(b6)
    );
    
    full_subtractor fs_7(
        .a(a[7]), 
        .b(b[7]), 
        .cin(b6),
        .d(diff[7]),
        .bi(bo)
    );
     
      
endmodule
