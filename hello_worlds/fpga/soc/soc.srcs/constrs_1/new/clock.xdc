create_clock -period 5.000 -name SYS_CLK_I -waveform {0.000 2.500} [get_ports SYS_CLK_I]

set_property CFGBVS VCCO [current_design]

set_property CONFIG_VOLTAGE 3.3 [current_design]
