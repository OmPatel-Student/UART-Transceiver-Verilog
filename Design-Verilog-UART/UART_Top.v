`timescale 1ns / 1ps

module UART_Top(
    input clk,
    input reset,
    input tx_start,
    input [7:0] data_in,
    input rx_serial,
    output [7:0] data_out,
    output tx_serial,
    output tx_busy,
    output rx_busy
);

wire tx_en, rx_en;

Baud_Rate_Gen baud_gen(
    .clk(clk),
    .reset(reset),
    .tx_en(tx_en),
    .rx_en(rx_en)
);

UART_Tx tx(
    .clk(clk),
    .reset(reset),
    .tx_en(tx_en),
    .tx_start(tx_start),
    .data_in(data_in),
    .tx_busy(tx_busy),
    .data_out(tx_serial)
);

UART_Rx rx(
    .clk(clk),
    .reset(reset),
    .rx_en(rx_en),
    .data_in(rx_serial),
    .data_out(data_out),
    .rx_busy(rx_busy)
);

endmodule