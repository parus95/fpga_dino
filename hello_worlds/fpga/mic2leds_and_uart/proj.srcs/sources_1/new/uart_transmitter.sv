`timescale 1ns / 1ps

module uart_transmitter(
    input clk,
    input [7:0] data,
    input strobe,
    output reg tx
);

    initial tx = 1'b1;
    reg[9:0] shr = 0;
    reg[10:0] counter = 0;
    
    always @(posedge clk)
        if (counter >= 11'd1735)
            counter <= 0;
        else
            counter <= counter + 1;
    
    always @(posedge clk) begin
        if (|shr) begin
            if (counter == 0) begin
                {shr, tx} <= {1'b0, shr};
            end            
        end else begin
            if (strobe) begin
                shr <= {1'b1,  data, 1'b0};        
            end
        end  
    end

endmodule
