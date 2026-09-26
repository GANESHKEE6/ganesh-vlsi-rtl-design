`timescale 1ns / 1ps

module uart_tx_tb;

    reg        clk;
    reg        rst;
    reg        wr_en;
    reg  [7:0] d_in;

    wire       tx;

    // Instantiate Top Level Module without parameters
    uart_tx_top DUT (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .d_in(d_in),
        .tx(tx)
    );

    // 100 MHz Clock (10ns period)
    always #5 clk = ~clk;

    initial begin
        clk   = 0;
        rst   = 1;
        wr_en = 0;
        d_in  = 8'h00;

        // Apply Reset
        #100;
        rst = 0;
        #20;

        // Transmit 1st Byte: 0xA5
        @(posedge clk);
        d_in  <= 8'hA5;
        wr_en <= 1'b1;
        @(posedge clk);
        wr_en <= 1'b0;

        // Wait 1.05 ms for complete 9600 Baud transmission
        #1050000;

        // Transmit 2nd Byte: 0x3C
        @(posedge clk);
        d_in  <= 8'h3C;
        wr_en <= 1'b1;
        @(posedge clk);
        wr_en <= 1'b0;

        #1050000;
        $finish;
    end

endmodule