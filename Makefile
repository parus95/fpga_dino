include Makefile.in

.PHONY: all restore clean run

all: run

restore:
	$(MAKE) -C pc

bitstream.bit:
	$(MAKE) -C fpga/hdl bitstream.bit
	cp ./fpga/hdl/bitstream.bit ./

firmware.bin:
	$(MAKE) -C fpga/sw firmware.bin
	cp fpga/sw/firmware.bin ./

clean:
	$(MAKE) -C pc clean
	$(MAKE) -C fpga/sw clean
	$(MAKE) -C fpga/hdl clean
	rm -f program

program: bitstream.bit firmware.bin
	$(VIVADO) -mode batch \
		-source ./fpga/tcl/convert.tcl \
		-source ./fpga/tcl/connect.tcl \
		-source ./fpga/tcl/program_sw.tcl \
		-source ./fpga/tcl/program_hw.tcl
	touch program


run: restore program
	$(MAKE) -C pc run
