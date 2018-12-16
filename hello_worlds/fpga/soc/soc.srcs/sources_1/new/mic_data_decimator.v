`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2018 02:24:00 PM
// Design Name: 
// Module Name: mic_data_decimator
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


module mic_data_decimator(
    input wire clk,
    
    input wire signed [7:0] data_in,
    input wire data_in_strobe,
    
    output reg signed [7:0] data_out,
    output reg data_out_strobe
);

    
    reg signed [10:0] micCumSum = 0;
    always @(posedge clk)
        if (data_in_strobe)
            micCumSum <= micCumSum + {{3{data_in[7]}}, data_in};
    
    reg signed [10:0] micCumSumPrev = 0;
    reg signed [15:0] strobe5KhzCounter = 0;
    reg strobe5Khz = 0;
    
    reg [7:0] micDataOn5Khz = 0;
    reg micDataOn5KhzStrobe = 0;
    always @(posedge clk) begin
        if (strobe5KhzCounter >= 16'd1999) begin
            strobe5KhzCounter <= 0;
            strobe5Khz <= 1;
        end else begin
            strobe5KhzCounter <= strobe5KhzCounter + 1;
            strobe5Khz <= 0;
        end
    
        if (strobe5Khz) begin
            micCumSumPrev <= micCumSum;
            data_out <= (micCumSum - micCumSumPrev) >> 3;    
        end
        data_out_strobe <= strobe5Khz;
    end

endmodule
