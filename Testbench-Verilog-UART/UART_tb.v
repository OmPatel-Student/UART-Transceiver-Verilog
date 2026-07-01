`timescale 1ns / 1ps

module UART_Top_tb;

reg clk, reset, tx_start;
reg [7:0] data_in;
wire [7:0] data_out;
wire tx_serial, tx_busy, rx_busy;

UART_Top DUT(
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .data_in(data_in),
    .rx_serial(tx_serial),
    .data_out(data_out),
    .tx_serial(tx_serial),
    .tx_busy(tx_busy),
    .rx_busy(rx_busy)
);

initial
begin
    clk =0;
    forever #10 clk = ~clk;
end

initial
begin
    reset =1;
    tx_start =0;
    data_in = 8'h00;
    #100;
    
    reset =0;
    #100;
    
    data_in = 8'hB1;
    tx_start =1;
    wait(tx_busy);
    
    tx_start =0;
    wait(!tx_busy);
    
    #1000;

    data_in = 8'hF3;
    tx_start =1;
    wait(tx_busy);
    
    tx_start =0;
    wait(!tx_busy);
    
    #1000;

    data_in = 8'hD2;
    tx_start = 1;
    wait(tx_busy);
    
    tx_start =0;
    wait(!tx_busy);
    
    #5000;
    
    $finish;
end
endmodule