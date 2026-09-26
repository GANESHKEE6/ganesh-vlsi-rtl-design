`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2026 10:47:07 AM
// Design Name: 
// Module Name: baud_rate_tb
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


module baud_rate_tb;

    reg clk ; 
    reg rst ; 
    
  //  wire tx_en ; 
    wire rx_en ; 
    
    BRG_RX DUT(
        .clk(clk) ,
         .rst(rst) ,
       //   .tx_en(tx_en) ,
          .rx_en(rx_en)
        );
        
   initial begin 
        clk = 0 ;
        rst = 0  ; 
   end
   
   always #5 clk = ~clk ; 
   
   initial begin 
        rst = 1 ; #10 ; rst = 0  ; 
        
        #500000 ;
        
        $finish ;
        
   end
  
endmodule
