`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2026 01:32:05 PM
// Design Name: 
// Module Name: universal_shift_register_tb
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


module univeral_shift_register_tb;
    
    reg clk ;
    reg rst ; 
    reg load ; 
    reg shift ; 
    reg s_in ; 
    reg [ 1 : 0 ] mode ; 
    reg [ 3 : 0 ] p_in ; 
    
    wire s_out ; 
    wire [ 3 : 0 ] p_out ; 
    
    universal_shift_register DUt(
        .clk(clk),
        .rst(rst),
        .load(load), 
        .shift(shift),
        .s_in(s_in),
        .mode(mode),
        .p_in(p_in),
        .s_out(s_out),
        .p_out(p_out)
    );
    
    initial begin 
        { clk , rst , load , shift , s_in , p_in } = 0 ; 
    end 
    
    always #5 clk = ~ clk ; 
    
    initial begin 
        rst = 1 ; #10 ; rst = 0 ; 
        
        #10 ; 
        
        mode = 2'b00 ; // siso 
        shift = 1'b1 ; 
        s_in = 1'b0; #10;
        s_in = 1'b1 ;  #10 ;
        s_in = 1'b0 ; # 10 ; 
        #50 ; 
        shift = 1'b0 ; 
        
        #10 ; 
        
        rst = 1 ; #10 ; rst = 0 ; 
        
        mode = 2'b01 ; // sipo  
        shift = 1'b1 ; 
        
        s_in = 1'b1 ; #10 ; 
        s_in = 1'b0 ; #10 ; 
        s_in = 1'b0 ; #10 ; 
        s_in = 1'b1 ; #10 ; 
        #10 ; 
        s_in = 1'b0 ; #10 ; 
        
        rst = 1 ; #10 ; rst = 0 ; #10 ; 
        
        load = 1'b1 ; 
        mode = 2'b10 ;
        p_in = 4'b1101 ; 
        #10 ; 
        load = 1'b0 ;  #10 ; 
        
        rst = 1'b1 ; #10 ; rst = 1'b0 ; #10 ; 
        
        load = 1'b1; 
        mode = 2'b11 ; 
        p_in = 4'b1010 ;  # 10 ; 
        load = 1'b0 ; 
        
        $finish ; 
        end
        
endmodule

