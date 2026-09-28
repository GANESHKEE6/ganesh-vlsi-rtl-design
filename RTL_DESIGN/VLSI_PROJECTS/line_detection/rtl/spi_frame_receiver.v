
`timescale 1ns / 1ps

module spi_frame_receiver (
    input  wire       spi_sck,
    input  wire       spi_cs,
    input  wire       spi_mosi,
    input  wire [9:0] read_addr,
    output wire [7:0] read_data
);

    (* ram_style = "distributed" *)
    reg [7:0] frame_buffer [0:1023];

    reg [7:0] shift_reg;
    reg [2:0] bit_count;
    reg [9:0] byte_count;
    reg frame_full;

    always @(posedge spi_sck or posedge spi_cs) begin
        if (spi_cs) begin
            shift_reg <= 8'h00;
            bit_count <= 3'd0;
            byte_count <= 10'd0;
            frame_full <= 1'b0;
        end
        else begin
            shift_reg <= {shift_reg[6:0], spi_mosi};

            if (bit_count == 3'd7) begin
                bit_count <= 3'd0;

                if (!frame_full) begin
                    frame_buffer[byte_count]
                        <= {shift_reg[6:0], spi_mosi};

                    if (byte_count == 10'd1023)
                        frame_full <= 1'b1;
                    else
                        byte_count <= byte_count + 1'b1;
                end
            end
            else begin
                bit_count <= bit_count + 1'b1;
            end
        end
    end

    assign read_data = frame_buffer[read_addr];

endmodule
