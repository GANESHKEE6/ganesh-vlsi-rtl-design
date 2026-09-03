`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2026 08:09:14 PM
// Design Name: 
// Module Name: binary_to_grey_code_dataflow_tb
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


module binary_to_grey_code_dataflow_tb;

    reg b0 ; reg b1 ; reg b2 ; reg b3 ; 
    wire g0 ; wire g1 ; wire g2 ; wire g3 ; 
    
    binary_to_grey_code_dataflow DUT(
    .b0(b0), 
    .b1(b1), 
    .b2(b2), 
    .b3(b3),
    .g0(g0),
    .g1(g1),
    .g2(g2),
    .g3(g3)
    );
    
    initial begin 
    
        b0 = 0 ; b1 = 0 ; b2 = 0 ; b3 = 0 ; #10;  
        
        b0 = 0 ; b1 = 0 ; b2 = 0 ; b3 = 1 ; #10;  
        
        b0 = 0 ; b1 = 0 ; b2 = 1 ; b3 = 0 ; #10;  
        
        b0 = 0 ; b1 = 0 ; b2 = 1 ; b3 = 1 ; #10;  
        
        b0 = 0 ; b1 = 1 ; b2 = 0 ; b3 = 0 ; #10;
        
        b0 = 0 ; b1 = 1 ; b2 = 0 ; b3 = 1 ; #10;
        
        b0 = 0 ; b1 = 1 ; b2 = 1 ; b3 = 0 ; #10;
        
        b0 = 0 ; b1 = 1 ; b2 = 1 ; b3 = 1 ; #10;
        
        b0 = 1 ; b1 = 0 ; b2 = 0 ; b3 = 0 ; #10;
        
        b0 = 1 ; b1 = 0 ; b2 = 0 ; b3 = 1 ; #10;
        
        b0 = 1 ; b1 = 0 ; b2 = 1 ; b3 = 0 ; #10;
        
        b0 = 1 ; b1 = 0 ; b2 = 1 ; b3 = 1 ; #10;
        
        b0 = 1 ; b1 = 1 ; b2 = 0 ; b3 = 0 ; #10;
            
        b0 = 1 ; b1 = 1 ; b2 = 0 ; b3 = 1 ; #10;
        
        b0 = 1 ; b1 = 1 ; b2 = 1 ; b3 = 0 ; #10;
        
        b0 = 1 ; b1 = 1 ; b2 = 1 ; b3 = 1 ; #10;
        
        $finish ; 
    
    end
        
            
                
endmodule 