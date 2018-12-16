module clk_wiz_0(
	input wire clk_in_200,
	output wire clk_out_10,
	input wire reset
);

assign clk_out_10 = clk_in_200;

endmodule
