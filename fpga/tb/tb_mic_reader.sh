iverilog -o t.vvp ../hdl/soc.srcs/sources_1/new/mic_reader.v tb_mic_reader.v || exit $?
vvp t.vvp || exit $?