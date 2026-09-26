`timescale 1ns / 1ps

module uart_transmitter (
    input  wire       clk,
    input  wire       rst,
    input  wire       wr_en,
    input  wire       tx_en,
    input  wire [7:0] d_in,
    output reg        tx,
    output reg        busy
);
    localparam IDLE  = 2'b00,
               START = 2'b01,
               DATA  = 2'b10,
               STOP  = 2'b11;

    reg [1:0] state;
    reg [2:0] index;
    reg [7:0] data_temp;

    always @(posedge clk) begin
        if (rst) begin
            state     <= IDLE;
            tx        <= 1'b1;
            busy      <= 1'b0;
            index     <= 3'd0;
            data_temp <= 8'd0;
        end else begin
            case (state)
                IDLE: begin
                    tx   <= 1'b1;
                    busy <= 1'b0;
                    if (wr_en) begin
                        data_temp <= d_in;
                        busy      <= 1'b1;
                        index     <= 3'd0; // Reset index for every new frame
                        state     <= START;
                    end
                end

                START: begin
                    busy <= 1'b1;
                    if (tx_en) begin
                        tx    <= 1'b0; // Start bit
                        state <= DATA;
                    end
                end

                DATA: begin
                    busy <= 1'b1;
                    if (tx_en) begin
                        tx <= data_temp[index]; // Send LSB to MSB
                        if (index == 3'd7) begin
                            state <= STOP;
                        end else begin
                            index <= index + 1'b1;
                        end
                    end
                end

                STOP: begin
                    busy <= 1'b1;
                    if (tx_en) begin
                        tx    <= 1'b1; // Stop bit
                        state <= IDLE;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule