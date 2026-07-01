`timescale 1ns / 1ps

module Baud_Rate_Gen(
    input clk,
    input reset,
    output reg tx_en,
    output reg rx_en
);

parameter clk_freq = 50000000;
parameter baudrate = 1562500;
parameter tx_rate = clk_freq/baudrate;
parameter rx_rate = tx_rate/16;
reg [7:0] tx_counter;
reg [7:0] rx_counter;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        tx_en <= 0;
        rx_en <= 0;
        tx_counter <=0;
        rx_counter <=0;
    end
    else
    begin
        if(tx_counter == tx_rate - 1)
        begin
            tx_en <= 1;
            tx_counter <=0;
        end
        else
        begin
            tx_counter <= tx_counter + 1'b1;
            tx_en <=0;
        end

        if(rx_counter == rx_rate - 1)
        begin
            rx_en <= 1;
            rx_counter <= 0;
        end
        else
        begin
            rx_counter <= rx_counter + 1'b1;
            rx_en <=0;
        end
    end
end
endmodule