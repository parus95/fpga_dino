set_property PROBES.FILE {} [lindex [get_hw_devices] 0]
set_property PROGRAM.FILE {/home/parus/git/fpga_dino/hello_worlds/fpga/soc/soc.runs/impl_1/main_wrapper.bit} [lindex [get_hw_devices] 0]
program_hw_devices [lindex [get_hw_devices] 0]
