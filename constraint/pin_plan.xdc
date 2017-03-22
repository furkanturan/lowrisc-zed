# ----------------------------------------------------------------------------
# JB Pmod - Bank 13
# ----------------------------------------------------------------------------
set_property PACKAGE_PIN W12 [get_ports SPI_CS]
set_property PACKAGE_PIN W11 [get_ports SPI_MOSI]
set_property PACKAGE_PIN V10 [get_ports SPI_MISO]
set_property PACKAGE_PIN W8 [get_ports SPI_SCLK]
#set_property PACKAGE_PIN V12 [get_ports {JB7}];  # "JB7"
#set_property PACKAGE_PIN W10 [get_ports {JB8}];  # "JB8"
#set_property PACKAGE_PIN V9 [get_ports {JB9}];  # "JB9"
#set_property PACKAGE_PIN V8 [get_ports {JB10}];  # "JB10"

#set_property IOSTANDARD LVCMOS33 [get_ports {lSPI_CS}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SPI_MOSI}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SPI_MISO}]
#set_property IOSTANDARD LVCMOS33 [get_ports {SPI_SCLK}]
# ----------------------------------------------------------------------------
# JC Pmod - Bank 13
# ----------------------------------------------------------------------------

# PMOD RS232

set_property PACKAGE_PIN AB6 [get_ports UART_CTS]
set_property PACKAGE_PIN AB7 [get_ports UART_RTS]
set_property PACKAGE_PIN AA4 [get_ports UART_TX]
set_property PACKAGE_PIN Y4 [get_ports UART_RX]

# PMOD USBUART

#set_property PACKAGE_PIN AB6 [get_ports UART_TX]
#set_property PACKAGE_PIN AB7 [get_ports UART_CTS]
#set_property PACKAGE_PIN AA4 [get_ports UART_RTS]
#set_property PACKAGE_PIN Y4 [get_ports UART_RX]

set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]]

# ----------------------------------------------------------------------------
# User LEDs - Bank 33
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN T22 [get_ports LED0]
#set_property PACKAGE_PIN T21 [get_ports LED1]
#set_property PACKAGE_PIN U22 [get_ports LED2]
#set_property PACKAGE_PIN U21 [get_ports LED3]
#set_property PACKAGE_PIN V22 [get_ports {LD4}];  # "LD4"
#set_property PACKAGE_PIN W22 [get_ports {LD5}];  # "LD5"
#set_property PACKAGE_PIN U19 [get_ports {LD6}];  # "LD6"
#set_property PACKAGE_PIN U14 [get_ports {LD7}];  # "LD7"

## ----------------------------------------------------------------------------
## User DIP Switches - Bank 35
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN F22 [get_ports SW0]
#set_property PACKAGE_PIN G22 [get_ports SW1]
#set_property PACKAGE_PIN H22 [get_ports SW2]
#set_property PACKAGE_PIN F21 [get_ports {SW3}];  # "SW3"
#set_property PACKAGE_PIN H19 [get_ports {SW4}];  # "SW4"
#set_property PACKAGE_PIN H18 [get_ports {SW5}];  # "SW5"
#set_property PACKAGE_PIN H17 [get_ports {SW6}];  # "SW6"
#set_property PACKAGE_PIN M15 [get_ports {SW7}];  # "SW7"

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


# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]]

# Note that the bank voltage for IO Bank 33 is fixed to 3.3V on ZedBoard.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]]

# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]]
