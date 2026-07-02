`timescale 1ns / 1ps

module UART_Rx_tb;

reg clk, reset, rx_en;
reg data_in;
wire [7:0] data_out;
wire rx_busy;

UART_Rx DUT(
    .clk(clk),
    .reset(reset),
    .rx_en(rx_en),
    .data_in(data_in),
    .data_out(data_out),
    .rx_busy(rx_busy)
);

initial
begin
    clk = 0;
    forever #10 clk = ~clk;
end

initial
begin
    reset = 1;
    rx_en = 0;
    data_in = 1'b1;

    #100;

    reset = 0;
    rx_en = 1;

    #100;

    data_in = 0; #320;
    data_in = 1; #320;
    data_in = 0; #320;
    data_in = 0; #320;
    data_in = 0; #320;
    data_in = 1; #320;
    data_in = 1; #320;
    data_in = 0; #320;
    data_in = 1; #320;
    data_in = 1; #320;   

    #300;
    data_in = 0; #320;
    data_in = 1; #320;
    data_in = 1; #320;
    data_in = 0; #320;
    data_in = 0; #320;
    data_in = 1; #320;
    data_in = 1; #320;
    data_in = 1; #320;
    data_in = 1; #320;
    data_in = 1; #320;

    #300;

    data_in = 0; #320;
    data_in = 0; #320;
    data_in = 1; #320;
    data_in = 0; #320;
    data_in = 0; #320;
    data_in = 1; #320;
    data_in = 0; #320;
    data_in = 1; #320;
    data_in = 1; #320;
    data_in = 1; #320;

    #1000;
    $finish;
end

endmodule
