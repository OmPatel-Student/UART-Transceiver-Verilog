`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.06.2026 13:50:09
// Design Name: 
// Module Name: UART_Tx
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module UART_Tx(
input clk,reset,
input tx_en,tx_start,
input [7:0]data_in,
output  reg tx_busy,
output reg data_out
    );

parameter idle=2'b00;
parameter start=2'b01;
parameter data=2'b10;
parameter stop=2'b11;
reg [1:0]state;
reg [7:0]shift_reg;
reg [2:0]counter;

always@(posedge clk or posedge reset)
begin
   if(reset)
   begin
      tx_busy <= 1'b0;
      data_out <= 1'b1;
      shift_reg <= 1'b0;
      counter <= 1'b0;
      state <= idle; 
   end
   else if(tx_en)
   begin
     case(state)
     idle : begin 
            tx_busy <= 1'b0;
            data_out <= 1'b1;
            if(tx_start)
            begin
               shift_reg <= data_in;
               counter <= 1'b0;
               state <= start;
            end       
            end
     start : begin
               tx_busy <= 1'b1;
               data_out <= 1'b0;
               state <= data;
             end
     data :  begin
             tx_busy <= 1'b1;
             data_out <= shift_reg[0];
             shift_reg <= shift_reg >> 1;
             if(counter == 7)
             begin
                state <= stop;
                counter <= 0;
             end
             else
             begin
               counter <= counter + 1'b1;
             end
             end
     stop :  begin
               tx_busy <= 1'b1;
               data_out <= 1'b1;
               state <= idle;
             end    
     endcase
   end
end
endmodule