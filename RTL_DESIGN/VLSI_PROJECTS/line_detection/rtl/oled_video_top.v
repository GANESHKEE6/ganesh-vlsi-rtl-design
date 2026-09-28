`timescale 1ns / 1ps

module oled_video_top (

    input  wire clk,

    // ========================================================
    // SPI from ESP32-CAM
    // ========================================================

    input  wire spi_sck,
    input  wire spi_cs,
    input  wire spi_mosi,

    // ========================================================
    // SH1106
    // ========================================================

    output wire oled_scl,
    inout  wire oled_sda

);


    // ========================================================
    // FRAMEBUFFER
    // ========================================================

    reg [9:0] display_address;


    wire [7:0] display_data;


    spi_frame_receiver framebuffer (

        .spi_sck  (spi_sck),
        .spi_cs   (spi_cs),
        .spi_mosi (spi_mosi),

        .read_addr(display_address),
        .read_data(display_data)

    );


    // ========================================================
    // I2C
    // ========================================================

    reg       i2c_start;

    reg [7:0] i2c_byte0;
    reg [7:0] i2c_byte1;

    wire      i2c_busy;
    wire      i2c_done;


    i2c_write2_400k i2c (

        .clk   (clk),

        .start (i2c_start),

        .byte0 (i2c_byte0),
        .byte1 (i2c_byte1),

        .busy  (i2c_busy),
        .done  (i2c_done),

        .scl   (oled_scl),
        .sda   (oled_sda)

    );


    // ========================================================
    // STATES
    // ========================================================

    localparam POWERUP       = 5'd0;

    localparam INIT_SEND     = 5'd1;

    localparam PAGE_CMD      = 5'd2;

    localparam COL_LOW       = 5'd3;

    localparam COL_HIGH      = 5'd4;

    localparam DATA_SEND     = 5'd5;

    localparam FRAME_DONE    = 5'd6;


    reg [4:0] state;


    // ========================================================
    // Counters
    // ========================================================

    reg [22:0] power_counter;

    reg [4:0] init_index;

    reg [2:0] page;

    reg [6:0] column;

    reg       waiting;


    // ========================================================
    // SH1106 INITIALIZATION
    // ========================================================

    function [7:0] init_command;

        input [4:0] index;

        begin

            case (index)

                0:  init_command = 8'hAE;

                1:  init_command = 8'hD5;
                2:  init_command = 8'h80;

                3:  init_command = 8'hA8;
                4:  init_command = 8'h3F;

                5:  init_command = 8'hD3;
                6:  init_command = 8'h00;

                7:  init_command = 8'h40;

                8:  init_command = 8'hAD;
                9:  init_command = 8'h8B;

                10: init_command = 8'hA1;

                11: init_command = 8'hC8;

                12: init_command = 8'hDA;
                13: init_command = 8'h12;

                14: init_command = 8'h81;
                15: init_command = 8'h7F;

                16: init_command = 8'hD9;
                17: init_command = 8'h22;

                18: init_command = 8'hDB;
                19: init_command = 8'h20;

                20: init_command = 8'hA4;

                21: init_command = 8'hA6;

                22: init_command = 8'hAF;

                default:
                    init_command = 8'hAE;

            endcase

        end

    endfunction


    // ========================================================
    // MAIN CONTROLLER
    // ========================================================

    always @(posedge clk)
    begin

        i2c_start <= 1'b0;


        case (state)


            // =================================================
            // 50 ms power-up delay
            // =================================================

            POWERUP:
            begin

                waiting <= 1'b0;


                if (power_counter ==
                    23'd4_999_999)
                begin

                    power_counter <= 0;

                    init_index <= 0;

                    state <= INIT_SEND;

                end

                else
                begin

                    power_counter <=
                        power_counter + 1'b1;

                end

            end


            // =================================================
            // SH1106 INIT
            // =================================================

            INIT_SEND:
            begin

                if (!waiting && !i2c_busy)
                begin

                    i2c_byte0 <= 8'h00;

                    i2c_byte1 <=
                        init_command(init_index);

                    i2c_start <= 1'b1;

                    waiting <= 1'b1;

                end


                if (waiting && i2c_done)
                begin

                    waiting <= 1'b0;


                    if (init_index == 22)
                    begin

                        page <= 0;

                        state <= PAGE_CMD;

                    end

                    else
                    begin

                        init_index <=
                            init_index + 1'b1;

                    end

                end

            end


            // =================================================
            // PAGE
            // =================================================

            PAGE_CMD:
            begin

                if (!waiting && !i2c_busy)
                begin

                    i2c_byte0 <= 8'h00;

                    i2c_byte1 <=
                        8'hB0 | page;

                    i2c_start <= 1'b1;

                    waiting <= 1'b1;

                    state <= COL_LOW;

                end

            end


            // =================================================
            // COLUMN LOW
            // =================================================

            COL_LOW:
            begin

                if (waiting && i2c_done)
                begin

                    waiting <= 1'b0;

                end


                if (!waiting && !i2c_busy)
                begin

                    i2c_byte0 <= 8'h00;

                    i2c_byte1 <= 8'h02;

                    i2c_start <= 1'b1;

                    waiting <= 1'b1;

                    state <= COL_HIGH;

                end

            end


            // =================================================
            // COLUMN HIGH
            // =================================================

            COL_HIGH:
            begin

                if (waiting && i2c_done)
                begin

                    waiting <= 1'b0;

                end


                if (!waiting && !i2c_busy)
                begin

                    i2c_byte0 <= 8'h00;

                    i2c_byte1 <= 8'h10;

                    i2c_start <= 1'b1;

                    waiting <= 1'b1;

                    column <= 0;

                    display_address <=
                        {page, 7'd0};

                    state <= DATA_SEND;

                end

            end


            // =================================================
            // DISPLAY DATA
            // =================================================

            DATA_SEND:
            begin

                if (waiting && i2c_done)
                begin

                    waiting <= 1'b0;


                    if (column == 127)
                    begin

                        column <= 0;


                        if (page == 7)
                        begin

                            state <= FRAME_DONE;

                        end

                        else
                        begin

                            page <=
                                page + 1'b1;

                            state <=
                                PAGE_CMD;

                        end

                    end

                    else
                    begin

                        column <=
                            column + 1'b1;

                        display_address <=
                            page * 128 +
                            column + 1'b1;

                    end

                end


                if (!waiting && !i2c_busy)
                begin

                    i2c_byte0 <= 8'h40;

                    i2c_byte1 <=
                        display_data;

                    i2c_start <= 1'b1;

                    waiting <= 1'b1;

                end

            end


            // =================================================
            // CONTINUOUS REFRESH
            // =================================================

            FRAME_DONE:
            begin

                page <= 0;

                column <= 0;

                display_address <= 0;

                state <= PAGE_CMD;

            end


            default:
            begin

                state <= POWERUP;

                power_counter <= 0;

            end

        endcase

    end


    // ========================================================
    // INITIAL STATE
    // ========================================================

    initial
    begin

        state = POWERUP;

        power_counter = 0;

        init_index = 0;

        page = 0;

        column = 0;

        display_address = 0;

        waiting = 0;

        i2c_start = 0;

        i2c_byte0 = 0;

        i2c_byte1 = 0;

    end

endmodule