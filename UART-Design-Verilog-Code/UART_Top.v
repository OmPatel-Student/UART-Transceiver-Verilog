module UART_Top(
input clk,reset,
input tx_start,
input [7:0]data_in,
input rx_serial,
output [7:0]data_out,
output tx_serial,
output tx_busy,rx_busy
  );
wire tx_en,rx_en;

Baud_rate_gen baud_gen_inst (
        .clk   (clk),
        .reset (reset),
        .tx_en (tx_en),
        .rx_en (rx_en)
    );
UART_Tx tx_inst (
        .clk      (clk),
        .reset    (reset),
        .tx_en    (tx_en),
        .tx_start (tx_start),
        .data_in  (data_in),
        .tx_busy  (tx_busy),
        .data_out (tx_serial)
    );
UART_Rx rx_inst (
        .clk      (clk),
        .reset    (reset),
        .rx_en    (rx_en),
        .data_in  (rx_serial),
        .data_out (data_out),
        .Rx_busy  (rx_busy)
    );

endmodule