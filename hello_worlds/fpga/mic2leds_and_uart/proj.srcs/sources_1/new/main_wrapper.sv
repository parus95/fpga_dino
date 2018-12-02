`timescale 1ns / 1ps

module main_wrapper(
    input SYS_CLK_I,
    input PB_RST,
    
    input USB_UART_RXD,
    output USB_UART_TXD,
    
    output USER_LED1,
    output USER_LED2,
    output USER_LED3,
    output USER_LED4,
    output USER_LED5,
    output USER_LED6,
    output USER_LED7,
    output USER_LED8,
    
    
    output PMOD4_D2_P,
    output PMOD4_D2_N,
    input PMOD4_D3_P,
    output PMOD4_D3_N
);
    wire 
        clk = SYS_CLK_I,
        reset = PB_RST;

    wire [7:0] leds;
    assign {
        USER_LED8,
        USER_LED7,
        USER_LED6,
        USER_LED5,
        USER_LED4,
        USER_LED3,
        USER_LED2,
        USER_LED1
    } = leds;



wire clk_spi;
wire miso, cs;

assign    
    PMOD4_D3_N = clk_spi,
    PMOD4_D2_N = 1'b0, //MOSI
    miso = PMOD4_D3_P,
    PMOD4_D2_P = cs;

wire [15:0] micData;
wire micStrobe;

MicReader micReaderInstance(
    .clk(clk_spi),
    .miso(miso),
    .cs(cs),
    
    .outData(micData),
    .outStrobe(micStrobe)
);


clk_wiz_0 clk_wiz(.clk_in1(clk)/*, .reset(reset)*/, .clk_out1(clk_spi));

wire signed  [7:0]
    micDataSigned = micData[11:4] - 8'd128;

reg signed [10:0] micCumSum = 0;
always @(posedge clk_spi)
    if (micStrobe)
        micCumSum <= micCumSum + {{3{micDataSigned[7]}},micDataSigned};

reg signed [10:0] micCumSumPrev = 0;
reg signed [15:0] strobe5KhzCounter = 0;
reg strobe5Khz = 0;

reg [7:0] micDataOn5Khz = 0;
reg micDataOn5KhzStrobe = 0;
always @(posedge clk) begin
    if (strobe5KhzCounter >= 16'd39999) begin
        strobe5KhzCounter <= 0;
        strobe5Khz <= 1;
    end else begin
        strobe5KhzCounter <= strobe5KhzCounter + 1;
        strobe5Khz <= 0;
    end

    if (strobe5Khz) begin
        micCumSumPrev <= micCumSum;
        micDataOn5Khz <= (micCumSum - micCumSumPrev) >> 3;    
    end
    micDataOn5KhzStrobe <= strobe5Khz;
end

wire [7:0]
    micDataAbs = (~micDataOn5Khz[7]) ? micDataOn5Khz : (~micDataOn5Khz + 1'b1);  

assign leds = micDataAbs;

uart_transmitter uartTx(
    .clk(clk),
    .data(micDataOn5Khz),
    .strobe(micDataOn5KhzStrobe),
    .tx(USB_UART_TXD)
);


endmodule
