set_property PROBES.FILE {} [lindex [get_hw_devices] 0]
set_property PROGRAM.FILE {bitstream.bit} [lindex [get_hw_devices] 0]
program_hw_devices [lindex [get_hw_devices] 0]
