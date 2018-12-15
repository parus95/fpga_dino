# ----------------------------------------------------------------------------
#     _____
#    / #   /____   \____
#  / \===\   \==/
# /___\===\___\/  AVNET ELECTRONICS MARKETING
#      \======/         www.em.avnet.com/drc
#       \====/
# ----------------------------------------------------------------------------
#
#  Created With Avnet Constraints Generator V0.8.0
#     Date: Wednesday, September 03, 2014
#     Time: 8:25:00 PM
#
#  This design is the property of Avnet.  Publication of this
#  design is not authorized without written consent from Avnet.
#
#  Please direct any questions to:
#     Avnet Technical Community Forums
#     http://community.em.avnet.com
#
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2014 Avnet, Inc.
#                              All rights reserved.
#
# ----------------------------------------------------------------------------
#
#  Notes:
#
#  03 September 2014
#
#     The string provided in the comment field provides the Zynq device pin
#     mapping through the expansion connector to the carrier card net name
#     according to the following format:
#
#     "<FPGA Pin>.<PCB Net>"
#
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# 32Kbit I2C EEPROM - Bank 14
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Configuration QSPI Flash - Bank 14
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN M15 [get_ports NetR32_1]
set_property PACKAGE_PIN L12 [get_ports QSPI_CSn]
set_property PACKAGE_PIN J13 [get_ports QSPI_DQ0]
set_property PACKAGE_PIN J14 [get_ports QSPI_DQ1]
set_property PACKAGE_PIN K15 [get_ports QSPI_DQ2]
set_property PACKAGE_PIN K16 [get_ports QSPI_DQ3]


# ----------------------------------------------------------------------------
# 200.00 MHz Clock Source - Bank 14
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN N11 [get_ports SYS_CLK_I]


# ----------------------------------------------------------------------------
# USB-UART - Bank 14
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN M12 [get_ports USB_UART_RXD]
set_property PACKAGE_PIN N6 [get_ports USB_UART_TXD]


# ----------------------------------------------------------------------------
# PHY Status - Bank 14
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# PHY1 RMII - Bank 14
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# PHY2 RMII - Bank 14
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Pmod6 - Bank 14
# ----------------------------------------------------------------------------

# ----------------------------------------------------------------------------
# Pmod3 - Bank 35
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN D6 [get_ports {J11_1}];  # "D6.PMOD3_D0_P" - J11 - Pin 1
set_property PACKAGE_PIN D5 [get_ports {J11_2}];  # "D5.PMOD3_D0_N" - J11 - Pin 2
set_property PACKAGE_PIN E3 [get_ports {J11_3}];  # "E3.PMOD3_D1_P" - J11 - Pin 3
set_property PACKAGE_PIN D3 [get_ports {J11_4}];  # "D3.PMOD3_D1_N" - J11 - Pin 4
set_property PACKAGE_PIN D4 [get_ports {J11_7}];  # "D4.PMOD3_D2_P" - J11 - Pin 7
set_property PACKAGE_PIN C4 [get_ports {J11_8}];  # "C4.PMOD3_D2_N" - J11 - Pin 8
set_property PACKAGE_PIN F5 [get_ports {J11_9}];  # "F5.PMOD3_D3_P" - J11 - Pin 9
set_property PACKAGE_PIN E5 [get_ports {J11_10}];  # "E5.PMOD3_D3_N" - J11 - Pin 10
# ----------------------------------------------------------------------------
# One wire Security EEPROM - Bank 14
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# I/O Test Point - Bank 14
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# 256MB DDR3 Memory - Bank 15
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# User DIP Switches - Bank 34
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# I/O Test Points - Bank 34
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# User LEDs - Bank 34
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN L5 [get_ports USER_LED1]
set_property PACKAGE_PIN L4 [get_ports USER_LED2]
set_property PACKAGE_PIN M4 [get_ports USER_LED3]
set_property PACKAGE_PIN N3 [get_ports USER_LED4]
set_property PACKAGE_PIN N2 [get_ports USER_LED5]
set_property PACKAGE_PIN M2 [get_ports USER_LED6]
set_property PACKAGE_PIN N1 [get_ports USER_LED7]
set_property PACKAGE_PIN M1 [get_ports USER_LED8]


# ----------------------------------------------------------------------------
# User Reset Button - Bank 34
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN T2 [get_ports PB_RST]


# ----------------------------------------------------------------------------
# User Push Buttons - Bank 34
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# User DIP Switches - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Pmod1 - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Pmod2 - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Pmod3 - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Pmod4 - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# Pmod5 - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# I/O Test Points - Bank 35
# ----------------------------------------------------------------------------


# ----------------------------------------------------------------------------
# IOSTANDARD Constraints
#
# Note that these IOSTANDARD constraints are applied to all IOs currently
# assigned within an I/O bank.  If these IOSTANDARD constraints are
# evaluated prior to other PACKAGE_PIN constraints being applied, then
# the IOSTANDARD specified will likely not be applied properly to those
# pins.  Therefore, bank wide IOSTANDARD constraints should be placed
# within the XDC file in a location that is evaluated AFTER all
# PACKAGE_PIN constraints within the target bank have been evaluated.
#
# Un-comment one or more of the following IOSTANDARD constraints according to
# the bank pin assignments that are required within a design.
# ----------------------------------------------------------------------------

# Set the bank voltage for IO Bank 14 to 3.3V by default.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 14]]

# Set the bank voltage for IO Bank 34 to 3.3V by default.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 34]]

# Set the bank voltage for IO Bank 35 to 3.3V by default.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]]
