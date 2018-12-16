`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2018 12:05:51 AM
// Design Name: 
// Module Name: xcorr
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


module xcorr(
    input clk,
    input data_in_avail,
    input signed [7:0] data_in,
    input wire [49:0] conf,
    output reg data_out_ready,
    output reg signed [7:0] data_out
);
    
`define WIDE(x) {{4{x[7]}}, x}
`define EL(x) +(conf[x-1] ? (`WIDE(shr[x])) : `WIDE(shr[x]))

reg signed [7:0]
        shr[1:50];
    
    reg data_avail_ = 0;
    integer i;
    always @(posedge clk) begin
        if (data_in_avail) begin
            shr[1] <= data_in;
            for (i=2; i<51; i= i+1) begin
                shr[i] <= shr[i - 1];
            end
        end
        data_avail_ <= data_in_avail;
        data_out_ready <= data_avail_;
        
        if (data_avail_) begin
            data_out <= ( 12'h000
                `EL(1)
                `EL(2)
                `EL(3)
                `EL(4)
                `EL(5)
                `EL(6)
                `EL(7)
                `EL(8)
                `EL(9)
                `EL(10)
                `EL(11)
                `EL(12)
                `EL(13)
                `EL(14)
                `EL(15)
                `EL(16)
                `EL(17)
                `EL(18)
                `EL(19)
                `EL(20)
                `EL(21)
                `EL(22)
                `EL(23)
                `EL(24)
                `EL(25)
                `EL(26)
                `EL(27)
                `EL(28)
                `EL(29)
                `EL(30)
                `EL(31)
                `EL(32)
                `EL(33)
                `EL(34)
                `EL(35)
                `EL(36)
                `EL(37)
                `EL(38)
                `EL(39)
                `EL(40)
                `EL(41)
                `EL(42)
                `EL(43)
                `EL(44)
                `EL(45)
                `EL(46)
                `EL(47)
                `EL(48)
                `EL(49)
                `EL(50)
            ) >> 4;
        end
    end    
endmodule
