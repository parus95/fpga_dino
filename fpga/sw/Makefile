
RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX = /opt/riscv32

SHELL = bash
FIRMWARE_OBJS = start.o main.o print.o
GCC_WARNS  = -Wall -Wextra -Wshadow -Wundef -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings
GCC_WARNS += -Wredundant-decls -Wstrict-prototypes -Wmissing-prototypes -pedantic # -Wconversion
TOOLCHAIN_PREFIX = $(RISCV_GNU_TOOLCHAIN_INSTALL_PREFIX)i/bin/riscv32-unknown-elf-
COMPRESSED_ISA = C

firmware.mcs: firmware.bin
	/opt/Xilinx/Vivado/2015.3/bin/vivado -mode batch -source ./tcl/convert.tcl -source ./tcl/connect.tcl -source ./tcl/program_sw.tcl  -source ./tcl/program_hw.tcl

firmware.hex: firmware.bin makehex.py
	python3 makehex.py $< 16384 > $@

firmware.bin: firmware.elf
	$(TOOLCHAIN_PREFIX)objcopy -O binary $< $@
	chmod -x $@


firmware.elf: $(FIRMWARE_OBJS) $(TEST_OBJS) sections.lds
	$(TOOLCHAIN_PREFIX)gcc -Os -ffreestanding -nostdlib -o $@ \
		-Wl,-Bstatic,-T,sections.lds,-Map,firmware.map,--strip-debug \
		$(FIRMWARE_OBJS) $(TEST_OBJS) -lgcc
	chmod -x $@

start.o: start.s
	$(TOOLCHAIN_PREFIX)gcc -c -march=rv32im$(subst C,c,$(COMPRESSED_ISA)) -o $@ $<

%.o: %.c
	$(TOOLCHAIN_PREFIX)gcc -c -march=rv32i$(subst C,c,$(COMPRESSED_ISA)) -Os --std=c99 $(GCC_WARNS) -ffreestanding -nostdlib -o $@ $<

clean:
	rm -rf riscv-gnu-toolchain-riscv32i riscv-gnu-toolchain-riscv32ic \
		riscv-gnu-toolchain-riscv32im riscv-gnu-toolchain-riscv32imc
	rm -vrf $(FIRMWARE_OBJS) $(TEST_OBJS) check.smt2 check.vcd synth.v synth.log \
		firmware.elf firmware.bin firmware.hex firmware.map firmware.mcs\
		testbench.vvp testbench_sp.vvp testbench_synth.vvp testbench_ez.vvp \
		testbench_rvf.vvp testbench_wb.vvp testbench.vcd testbench.trace \
		testbench_verilator testbench_verilator_dir

.PHONY: firmware.mcs
