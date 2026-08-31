`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/31/2026 03:37:53 PM
// Design Name: 
// Module Name: or_gate_tb
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

module or_gate_tb ;
    
    reg a ;
    reg b ;
    wire y ;
    
    or_gate DUT (
    .a(a),
    .b(b),
    .y(y)
    );



    // 3. Apply stimulus
    initial begin
        
        // Test Case 1
        a = 0; b = 0;
        #10;
        
        // Test Case 2
        a = 0; b = 1;
        #10;
        
        // Test Case 3
        a = 1; b = 0;
        #10;
        
        // Test Case 4
        a = 1; b = 1;
        #10;
        
        // Stop simulation
        $finish;
    end

    // Optional: Print output to the Vivado Tcl Console automatically
    initial begin
        $monitor("Time=%0t | a=%b b=%b | Output y=%b", $time, a, b, y);
    end

endmodule
    