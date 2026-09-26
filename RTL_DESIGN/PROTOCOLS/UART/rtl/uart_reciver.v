`timescale 1ns / 1ps

module uart_reciver(
    input  wire       clk,
    input  wire       rst,
    input  wire       rx_en,
    input  wire       rx,
    output reg  [7:0] d_out,
    output reg        rdy
);

    localparam IDLE  = 2'b00,
               START = 2'b01,
               DATA  = 2'b10,
               STOP  = 2'b11;

    reg [1:0] state;
    reg [2:0] index;
    reg [3:0] sample;
    reg [7:0] data_temp;

    always @(posedge clk) begin
        if (rst) begin
            state     <= IDLE;
            sample    <= 0;
            index     <= 0;
            d_out     <= 0;
            rdy       <= 0;
            data_temp <= 0;
        end else begin
            rdy <= 1'b0; // Automatically pulls rdy LOW on the next clock tick

            if (rx_en) begin
                case (state)

                    IDLE: begin
                        sample <= 0;
                        index  <= 0;
                        if (rx == 1'b0) begin // Start bit detected (LOW)
                            state <= START;
                        end
                    end

                    START: begin
                        // Wait 8 oversample ticks to align to the middle of the bit
                        if (sample == 7) begin
                            sample <= 0;
                            state  <= DATA;
                        end else begin
                            sample <= sample + 1'b1;
                        end
                    end

                    DATA: begin
                        // Wait 16 ticks for every full data bit
                        if (sample == 15) begin
                            sample <= 0;
                            data_temp[index] <= rx; // Read bit at the center

                            if (index == 7)
                                state <= STOP;
                            else
                                index <= index + 1'b1;
                        end else begin
                            sample <= sample + 1'b1;
                        end
                    end

                    STOP: begin
                        // Wait 16 ticks for the stop bit
                        if (sample == 15) begin
                            sample <= 0;
                            d_out  <= data_temp;
                            rdy    <= 1'b1; // Pulse ready HIGH
                            state  <= IDLE; // Return to IDLE to await next frame
                        end else begin
                            sample <= sample + 1'b1;
                        end
                    end

                    default: state <= IDLE;

                endcase
            end
        end
    end

endmodule