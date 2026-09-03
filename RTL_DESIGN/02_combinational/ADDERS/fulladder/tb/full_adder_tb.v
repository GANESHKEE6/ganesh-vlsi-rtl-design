`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/01/2026 01:58:13 PM
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb;

    reg a ; 
    reg b ; 
    reg cin ; 
    
    wire sum ; 
    wire cout ; 
    
    full_adder_behavioral DUT(
    .a(a) , 
    .b(b) ,
    .cin(cin) ,
    
    .sum(sum) , 
    .cout(cout) 
    
    );
    
    initial begin 
    
        a = 0 ;  b = 0 ;  cin = 0 ; 
        #10;
        
        a = 0 ;  b = 0;  cin = 1 ; 
        #10;
        
        a = 0 ;  b = 1 ;  cin = 0 ; 
        #10;
        
        a = 0 ;  b = 1 ;  cin = 1 ; 
        #10;
        
        a = 1 ;  b = 0 ;  cin = 0 ; 
        #10;
        
        a = 1 ;  b = 0 ;  cin = 1 ; 
        #10;
        
        a = 1 ;  b = 1 ;  cin = 0 ; 
        #10;
        
        a = 1 ;  b = 1 ;  cin = 1 ; 
        #10;
        $finish;
        
    end
    
endmodule
