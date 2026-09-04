`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2026 06:35:11 PM
// Design Name: 
// Module Name: full_adder_4_bit_tb
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
/////////////////////////////////////////////////////////////////////////////////

module full_adder_4_bit_tb; 

    integer i , j ; 
    reg [3:0] a ; 
    reg [3:0] b ;
    reg cin ; 
    wire [3:0] sum ;
    wire cout ;
    
    full_adder_4_bit DUT(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );
    
    initial begin 
        cin = 0 ; 
        
        for( i = 0 ; i < 16 ; i = i + 1) 
        begin 
            for( j = 0 ; j < 16 ; j = j + 1)
                begin 
                    a = i ; 
                    b = j ;
                    #5; 
                end
        end 
        $finish ; 
        
    end
 
endmodule 