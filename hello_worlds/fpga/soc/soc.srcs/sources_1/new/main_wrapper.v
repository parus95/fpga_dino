`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2018 12:05:49 AM
// Design Name: 
// Module Name: main_wrapper
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


module main_wrapper(
    input wire SYS_CLK_I,
    input wire PB_RST,

    input wire USB_UART_RXD,
    output wire USB_UART_TXD,

    output wire NetR32_1,
    output wire QSPI_CSn,
    inout tri QSPI_DQ0,
    inout tri QSPI_DQ1,
    inout tri QSPI_DQ2,
    inout tri QSPI_DQ3,

    output wire USER_LED1,
    output wire USER_LED2,
    output wire USER_LED3,
    output wire USER_LED4,
    output wire USER_LED5,
    output wire USER_LED6,
    output wire USER_LED7,
    output wire USER_LED8,
    
    output wire J11_1,
    output wire J11_2,
    output wire J11_3,
    output wire J11_4,
    output wire J11_7,
    output wire J11_8,
    output wire J11_9,
    output wire J11_10
);

assign J11_1 = USB_UART_TXD;
assign J11_2 = NetR32_1;
assign J11_3 = QSPI_CSn;
assign J11_4 = QSPI_DQ0;
assign J11_7 = QSPI_DQ1;
assign J11_8 = QSPI_DQ2;
assign J11_9 = QSPI_DQ3;
assign J11_10 = 1'b0;


reg[7:0] leds = 0;

assign {
    USER_LED1,
    USER_LED2,
    USER_LED3,
    USER_LED4,
    USER_LED5,
    USER_LED6,
    USER_LED7,
    USER_LED8
} = leds;

wire [3:0] flash_io_oe, flash_io_do;

reg         iomem_ready = 0;
wire        iomem_valid;
wire [3:0]  iomem_wstrb;
wire [31:0] iomem_addr;
wire [31:0] iomem_wdata;
reg  [31:0] iomem_rdata = 0;

wire clk;

clk_wiz_0 pll(.clk_in_200(SYS_CLK_I), .clk_out_10(clk), .reset(PB_RST));

wire rst;

rst_spike spike(
    .clk(clk),
    .rst_in(PB_RST),
    .spi_clk(NetR32_1),
    .rst_out(rst)
);

picosoc soc(
	.clk(clk),
	.resetn(~rst),

	.iomem_ready(iomem_ready),

	.iomem_valid(iomem_valid),
	.iomem_wstrb(iomem_wstrb),
	.iomem_addr(iomem_addr),
	.iomem_wdata(iomem_wdata),
	.iomem_rdata(iomem_rdata),
/*
	input  irq_5,
	input  irq_6,
	input  irq_7,
*/
	.ser_tx(USB_UART_TXD),
	.ser_rx(USB_UART_RXD),

	.flash_csb(QSPI_CSn),
	.flash_clk(NetR32_1),

	.flash_io0_oe(flash_io_oe[0]),
	.flash_io1_oe(flash_io_oe[1]),
	.flash_io2_oe(flash_io_oe[2]),
	.flash_io3_oe(flash_io_oe[3]),

	.flash_io0_do(flash_io_do[0]),
	.flash_io1_do(flash_io_do[1]),
	.flash_io2_do(flash_io_do[2]),
	.flash_io3_do(flash_io_do[3]),

	.flash_io0_di(QSPI_DQ0),
	.flash_io1_di(QSPI_DQ1),
	.flash_io2_di(QSPI_DQ2),
	.flash_io3_di(QSPI_DQ3)
);

assign
    QSPI_DQ0 = flash_io_oe[0] ? flash_io_do[0] : 1'bz,
    QSPI_DQ1 = flash_io_oe[1] ? flash_io_do[1] : 1'bz,
    QSPI_DQ2 = flash_io_oe[2] ? flash_io_do[2] : 1'bz,
    QSPI_DQ3 = flash_io_oe[3] ? flash_io_do[3] : 1'bz;

always @(posedge clk) begin
    if (iomem_valid && !iomem_ready && iomem_addr == 32'h0300_0000) begin
        if (iomem_wstrb[0]) leds <= iomem_wdata[7:0];

        iomem_rdata <= {24'h000000, leds};
        iomem_ready <= 1'b1;
    end else begin
        iomem_rdata <= 32'hXXXXXXXX;
        iomem_ready <= 1'b0;
    end
end

endmodule
