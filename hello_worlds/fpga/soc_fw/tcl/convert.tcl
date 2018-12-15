write_cfgmem -force -format MCS -size 256 -interface SPIx1 \
-loaddata "up 0x100000 ./firmware.bin" \
-file firmware.mcs
