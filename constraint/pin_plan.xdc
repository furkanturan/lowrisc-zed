# ----------------------------------------------------------------------------
# JB Pmod - Bank 13
# ----------------------------------------------------------------------------

# PMOD SD

set_property PACKAGE_PIN W12 [get_ports SPI_CS]
set_property PACKAGE_PIN W11 [get_ports SPI_MOSI]
set_property PACKAGE_PIN V10 [get_ports SPI_MISO]
set_property PACKAGE_PIN W8 [get_ports SPI_SCLK]

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

# Note that the bank voltage for IO Bank 13 is fixed to 3.3V on ZedBoard.
set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 13]]


# ----------------------------------------------------------------------------
# User LEDs - Bank 33
# ----------------------------------------------------------------------------
#set_property PACKAGE_PIN T22 [get_ports LED0]
#set_property PACKAGE_PIN T21 [get_ports LED1]
#set_property PACKAGE_PIN U22 [get_ports LED2]
#set_property PACKAGE_PIN U21 [get_ports LED3]
#set_property PACKAGE_PIN V22 [get_ports LED4]
#set_property PACKAGE_PIN W22 [get_ports LED5]
#set_property PACKAGE_PIN U19 [get_ports LED6]
#set_property PACKAGE_PIN U14 [get_ports LED7]

# Note that the bank voltage for IO Bank 33 is fixed to 3.3V on ZedBoard.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 33]]


## ----------------------------------------------------------------------------
## User DIP Switches - Bank 35
## ----------------------------------------------------------------------------
#set_property PACKAGE_PIN F22 [get_ports SW0]
#set_property PACKAGE_PIN G22 [get_ports SW1]
#set_property PACKAGE_PIN H22 [get_ports SW2]
#set_property PACKAGE_PIN F21 [get_ports SW3]
#set_property PACKAGE_PIN H19 [get_ports SW4]
#set_property PACKAGE_PIN H18 [get_ports SW5]
#set_property PACKAGE_PIN H17 [get_ports SW6]
#set_property PACKAGE_PIN M15 [get_ports SW7]


# Set the bank voltage for IO Bank 35 to 1.8V by default.
# set_property IOSTANDARD LVCMOS33 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS25 [get_ports -of_objects [get_iobanks 35]];
# set_property IOSTANDARD LVCMOS18 [get_ports -of_objects [get_iobanks 35]]