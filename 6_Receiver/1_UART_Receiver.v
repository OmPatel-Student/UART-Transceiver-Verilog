`timescale 1ns / 1ps

module UART_Rx(
    input clk,
    input reset,
    input rx_en,
    input data_in,
    output reg [7:0] data_out,
    output reg rx_busy
);

parameter idle = 2'b00;
parameter start = 2'b01;
parameter data = 2'b10;
parameter stop = 2'b11;
reg [1:0] state;
reg [3:0] counter;
reg [2:0] sample_counter;
reg [7:0] shift_reg;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        data_out <= 8'b0;
        rx_busy <= 1'b0;
        state <= idle;
        counter <= 4'b0;
        sample_counter <= 3'b0;
        shift_reg <= 8'b0;
    end
    else if(rx_en)
    begin
        case(state)

            idle:
            begin
                rx_busy <= 1'b0;

                if (data_in == 1'b0)
                begin
                    state <= start;
                    shift_reg <= 8'b0;
                    counter <=4'b0;
                end
            end

            start:
            begin
                rx_busy <= 1'b1;

                if (counter == 4'd7)
                begin
                    counter <= 4'b0;

                    if (data_in == 1'b0)
                    begin
                        state <=data;
                        sample_counter <= 3'b0;
                    end
                    else
                    begin
                        state <= idle;
                        counter <=4'b0;
                    end
                end
                else
                begin
                    counter <= counter + 1'b1;
                end
            end

            data:
            begin
                rx_busy <= 1'b1;

                if (counter == 4'd15)
                begin
                    counter <= 4'b0;
                    shift_reg[sample_counter] <= data_in;

                    if (sample_counter == 3'd7)
                    begin
                        state <= stop;
                        sample_counter <=3'b0;
                    end
                    else
                    begin
                        sample_counter <= sample_counter + 1'b1;
                    end
                end
                else
                begin
                    counter <= counter + 1'b1;
                end
            end

            stop:
            begin
                rx_busy <= 1'b1;

                if (counter == 4'd15)
                begin
                    counter <=4'b0;

                    if (data_in == 1'b1)
                    begin
                        data_out <= shift_reg;
                    end

                    state <= idle;
                end
                else
                begin
                    counter <= counter + 1'b1;
                end
            end
        endcase
    end
end
endmodule