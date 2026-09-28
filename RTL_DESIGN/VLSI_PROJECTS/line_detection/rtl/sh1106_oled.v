module sh1106_oled (
    input  wire       clk,

    input  wire       line_detected,
    input  wire [6:0] line_position,

    output wire       oled_scl,
    inout  wire       oled_sda
);

    // ========================================================
    // I2C MASTER SIGNALS
    // ========================================================

    reg       i2c_start;
    reg       i2c_stop;
    reg       i2c_write;

    reg [7:0] i2c_data;

    wire i2c_busy;
    wire i2c_done;
    wire i2c_ack_error;

    // ========================================================
    // I2C MASTER
    // ========================================================

    i2c_master #(
        .CLK_FREQ(100_000_000),
        .I2C_FREQ(100_000)
    ) i2c (
        .clk(clk),

        .start(i2c_start),
        .stop(i2c_stop),
        .write(i2c_write),

        .write_data(i2c_data),

        .busy(i2c_busy),
        .done(i2c_done),
        .ack_error(i2c_ack_error),

        .scl(oled_scl),
        .sda(oled_sda)
    );

    // ========================================================
    // INITIALIZATION ROM
    // ========================================================

    reg [7:0] init_rom [0:22];

    initial begin

        init_rom[0]  = 8'hAE; // display OFF

        init_rom[1]  = 8'hD5;
        init_rom[2]  = 8'h80;

        init_rom[3]  = 8'hA8;
        init_rom[4]  = 8'h3F;

        init_rom[5]  = 8'hD3;
        init_rom[6]  = 8'h00;

        init_rom[7]  = 8'h40;

        init_rom[8]  = 8'hAD;
        init_rom[9]  = 8'h8B;

        init_rom[10] = 8'hA1;

        init_rom[11] = 8'hC8;

        init_rom[12] = 8'hDA;
        init_rom[13] = 8'h12;

        init_rom[14] = 8'h81;
        init_rom[15] = 8'h80;

        init_rom[16] = 8'hD9;
        init_rom[17] = 8'h1F;

        init_rom[18] = 8'hDB;
        init_rom[19] = 8'h40;

        init_rom[20] = 8'hA4;

        init_rom[21] = 8'hA6;

        init_rom[22] = 8'hAF; // display ON

    end

    // ========================================================
    // STATES
    // ========================================================

    localparam POWER_WAIT = 0;

    localparam INIT_START = 1;
    localparam INIT_ADDR  = 2;
    localparam INIT_CTRL  = 3;
    localparam INIT_CMD   = 4;
    localparam INIT_STOP  = 5;
    localparam INIT_NEXT  = 6;

    localparam PAGE_START = 7;
    localparam PAGE_ADDR  = 8;
    localparam PAGE_CTRL  = 9;
    localparam PAGE_CMD   = 10;
    localparam PAGE_COL_L = 11;
    localparam PAGE_COL_H = 12;
    localparam PAGE_STOP  = 13;

    localparam DATA_START = 14;
    localparam DATA_ADDR  = 15;
    localparam DATA_CTRL  = 16;
    localparam DATA_BYTE  = 17;
    localparam DATA_STOP  = 18;

    localparam REFRESH    = 19;

    reg [4:0] state = POWER_WAIT;

    // ========================================================
    // COUNTERS
    // ========================================================

    reg [23:0] power_counter = 0;

    reg [4:0] init_index = 0;

    reg [2:0] page = 0;

    reg [6:0] column = 0;

    // ========================================================
    // DISPLAY BYTE
    // ========================================================

    reg [7:0] display_byte;

    always @(*) begin

        if (line_detected &&
            column == line_position)

            display_byte = 8'hFF;

        else

            display_byte = 8'h00;

    end

    // ========================================================
    // MAIN FSM
    // ========================================================

    always @(posedge clk) begin

        // Default: no command pulse

        i2c_start <= 1'b0;
        i2c_stop  <= 1'b0;
        i2c_write <= 1'b0;

        case (state)

            // =================================================
            // POWER-UP DELAY
            // =================================================

            POWER_WAIT: begin

                if (power_counter < 24'd5_000_000) begin

                    power_counter <= power_counter + 1'b1;

                end
                else begin

                    init_index <= 0;

                    state <= INIT_START;

                end

            end

            // =================================================
            // INITIALIZATION
            // =================================================

            INIT_START: begin

                if (!i2c_busy) begin

                    i2c_start <= 1'b1;

                    state <= INIT_ADDR;

                end

            end

            INIT_ADDR: begin

                if (i2c_done) begin

                    i2c_data <= 8'h78;

                    i2c_write <= 1'b1;

                    state <= INIT_CTRL;

                end

            end

            INIT_CTRL: begin

                if (i2c_done) begin

                    // Command mode

                    i2c_data <= 8'h00;

                    i2c_write <= 1'b1;

                    state <= INIT_CMD;

                end

            end

            INIT_CMD: begin

                if (i2c_done) begin

                    i2c_data <= init_rom[init_index];

                    i2c_write <= 1'b1;

                    state <= INIT_STOP;

                end

            end

            INIT_STOP: begin

                if (i2c_done) begin

                    i2c_stop <= 1'b1;

                    state <= INIT_NEXT;

                end

            end

            INIT_NEXT: begin

                if (i2c_done) begin

                    if (init_index == 22) begin

                        page <= 0;

                        state <= PAGE_START;

                    end
                    else begin

                        init_index <= init_index + 1'b1;

                        state <= INIT_START;

                    end

                end

            end

            // =================================================
            // PAGE COMMAND TRANSACTION
            // =================================================

            PAGE_START: begin

                if (!i2c_busy) begin

                    i2c_start <= 1'b1;

                    state <= PAGE_ADDR;

                end

            end

            PAGE_ADDR: begin

                if (i2c_done) begin

                    i2c_data <= 8'h78;

                    i2c_write <= 1'b1;

                    state <= PAGE_CTRL;

                end

            end

            PAGE_CTRL: begin

                if (i2c_done) begin

                    // Command mode

                    i2c_data <= 8'h00;

                    i2c_write <= 1'b1;

                    state <= PAGE_CMD;

                end

            end

            PAGE_CMD: begin

                if (i2c_done) begin

                    // Page address

                    i2c_data <= 8'hB0 + page;

                    i2c_write <= 1'b1;

                    state <= PAGE_COL_L;

                end

            end

            PAGE_COL_L: begin

                if (i2c_done) begin

                    // SH1106 visible display starts at column 2

                    i2c_data <= 8'h02;

                    i2c_write <= 1'b1;

                    state <= PAGE_COL_H;

                end

            end

            PAGE_COL_H: begin

                if (i2c_done) begin

                    i2c_data <= 8'h10;

                    i2c_write <= 1'b1;

                    state <= PAGE_STOP;

                end

            end

            PAGE_STOP: begin

                if (i2c_done) begin

                    i2c_stop <= 1'b1;

                    column <= 0;

                    state <= DATA_START;

                end

            end

            // =================================================
            // DATA TRANSACTION
            // =================================================

            DATA_START: begin

                if (!i2c_busy) begin

                    i2c_start <= 1'b1;

                    state <= DATA_ADDR;

                end

            end

            DATA_ADDR: begin

                if (i2c_done) begin

                    i2c_data <= 8'h78;

                    i2c_write <= 1'b1;

                    state <= DATA_CTRL;

                end

            end

            DATA_CTRL: begin

                if (i2c_done) begin

                    // Data mode

                    i2c_data <= 8'h40;

                    i2c_write <= 1'b1;

                    state <= DATA_BYTE;

                end

            end

            DATA_BYTE: begin

                if (i2c_done) begin

                    i2c_data <= display_byte;

                    i2c_write <= 1'b1;

                    if (column == 127) begin

                        state <= DATA_STOP;

                    end
                    else begin

                        column <= column + 1'b1;

                    end

                end

            end

            // =================================================
            // DATA STOP
            // =================================================

            DATA_STOP: begin

                if (i2c_done) begin

                    i2c_stop <= 1'b1;

                    state <= REFRESH;

                end

            end

            // =================================================
            // NEXT PAGE / FRAME
            // =================================================

            REFRESH: begin

                if (i2c_done) begin

                    if (page == 7) begin

                        page <= 0;

                    end
                    else begin

                        page <= page + 1'b1;

                    end

                    state <= PAGE_START;

                end

            end

            default: begin

                state <= POWER_WAIT;

            end

        endcase

    end

endmodule