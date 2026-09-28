
## 100 MHz clock
set_property -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS33} [get_ports {clk}]
create_clock -add -name sys_clk_pin -period 10.00 [get_ports {clk}]

## ESP32-CAM SPI - Pmod JB
set_property -dict {PACKAGE_PIN A16 IOSTANDARD LVCMOS33} [get_ports {spi_sck}]
set_property -dict {PACKAGE_PIN B15 IOSTANDARD LVCMOS33} [get_ports {spi_mosi}]
set_property -dict {PACKAGE_PIN B16 IOSTANDARD LVCMOS33} [get_ports {spi_cs}]

## OLED - Pmod JA
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33} [get_ports {oled_scl}]
set_property -dict {PACKAGE_PIN L2 IOSTANDARD LVCMOS33} [get_ports {oled_sda}]
