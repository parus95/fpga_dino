VERILOG_FILES = testbench.v \
		./spiflash.v ./clk_mock.v \
		../../soc/soc.srcs/sources_1/new/main_wrapper.v \
		../../soc/soc.srcs/sources_1/new/rst_spike.v \
		../../soc/soc.srcs/sources_1/imports/picosoc/spimemio.v \
		../../soc/soc.srcs/sources_1/imports/picorv32/picosoc/picosoc.v \
		../../soc/soc.srcs/sources_1/imports/picorv32/picorv32.v \
		../../soc/soc.srcs/sources_1/imports/picorv32/picosoc/simpleuart.v 

simulate.bin: $(VERILOG_FILES)
	iverilog $(VERILOG_FILES)\
		-o simulate.bin
clean:
	rm -f simulate.bin
	
