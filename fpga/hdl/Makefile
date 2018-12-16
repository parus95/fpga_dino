include ../../Makefile.in

./soc/soc.runs/impl_1/main_wrapper.bit: soc/soc.xpr
	$(VIVADO) -mode batch -source build.tcl soc/soc.xpr

bitstream.bit: ./soc/soc.runs/impl_1/main_wrapper.bit
	cp ./soc/soc.runs/impl_1/main_wrapper.bit ./bitstream.bit

soc/soc.xpr: proj_init.tcl
	$(VIVADO) -mode batch -source proj_init.tcl

.PHONY: clean
clean:
	rm -rf ./soc

