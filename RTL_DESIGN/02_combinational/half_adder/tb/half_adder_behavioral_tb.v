`timescale 1ns / 10ps

module half_adder_behavioral_tb;

    reg a;
    reg b;

    wire sum;
    wire carry;

    // Instantiate the DUT
    half_adder_behavioral DUT (
        .a(a),
        .b(b),
        .sum(sum),
        .carry(carry)
    );

    initial begin

        // Test 1
        a = 0;
        b = 0;
        #10;

        // Test 2
        a = 0;
        b = 1;
        #10;

        // Test 3
        a = 1;
        b = 0;
        #10;

        // Test 4
        a = 1;
        b = 1;
        #10;

        $finish;

    end

endmodule