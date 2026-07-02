`timescale 1ns / 1ps

module UART_Tx_tb;

reg clk, reset, tx_en, tx_start;
reg [7:0] data_in;
wire tx_busy;
wire data_out;

UART_Tx DUT(
    .clk(clk),
    .reset(reset),
    .tx_en(tx_en),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx_busy(tx_busy),
    .data_out(data_out)
);

initial
begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial
begin
    reset = 1;
    tx_en = 0;
    tx_start =0;
    data_in = 8'h00;

    #100;

    reset = 0;
    tx_en = 1;

    #100;

    data_in = 8'hB1;
    tx_start =1;
    wait(tx_busy);

    tx_start = 0;
    wait(!tx_busy);

    #300;

    data_in = 8'hF3;
    tx_start = 1;
    wait(tx_busy);

    tx_start = 0;
    wait(!tx_busy);

    #300;

    data_in = 8'hD2;
    tx_start =1;
    wait(tx_busy);

    tx_start = 0;
    wait(!tx_busy);

    #800;

    $finish;
end

endmodule
