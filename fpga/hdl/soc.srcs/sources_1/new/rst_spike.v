`timescale 1ns / 1ps

`define FREQ 10_000_000 // 10MHz
`define MS (`FREQ / 1000)
`define WDT_WAIT `MS
`define WDT_RST (`MS / 2)
`define WDT_PERIOD (`WDT_WAIT + `WDT_RST)

module rst_spike(
    input wire clk,
    input wire rst_in,
    input wire spi_clk,
    output reg rst_out
);

reg[31:0] wdt = 0;

reg spi_clk_prev = 0;

always @(posedge clk) begin
  spi_clk_prev <= spi_clk;

  if (spi_clk != spi_clk_prev || rst_in) begin
    wdt <= 0;
  end else if (wdt < `WDT_PERIOD) begin
    wdt <= wdt + 1;
  end else begin
    wdt <= 0;
  end

  rst_out <= (wdt > `WDT_WAIT) || rst_in;
end

endmodule
