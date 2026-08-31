`timescale 1ns / 1ps

module and_gate_tb;

    // 1. Declare inputs as 'reg' and outputs as 'wire'
    reg a;
    reg b;
    wire y;

    // 2. Instantiate the Design Under Test (DUT)
    // NOTE: Change "and_gate" to match your exact module name 
    // (e.g., and_gate_dataflow, and_gate_behavioral)
    and_gate DUT (
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