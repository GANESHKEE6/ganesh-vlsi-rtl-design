`timescale 1ns / 1ps

module baud_rate_generator (
    input  wire clk,
    input  wire rst,
    output reg  tx_en
);
    reg [14:0] tx_counter;

    // 100 MHz clock / 9600 Baud = 10416 cycles per bit
    always @(posedge clk) begin
        if (rst) begin
            tx_counter <= 15'd0;
            tx_en      <= 1'b0;
        end else if (tx_counter >= 15'd10415) begin // 10416 - 1 = 10415
            tx_counter <= 15'd0;
            tx_en      <= 1'b1;
        end else begin
            tx_counter <= tx_counter + 1'b1;
            tx_en      <= 1'b0;
        end
    end
endmodule