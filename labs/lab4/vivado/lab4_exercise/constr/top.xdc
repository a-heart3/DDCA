#clock
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10 -waveform {0 5} [get_ports clk]

# leds
set_property PACKAGE_PIN U16 [get_ports led0]
set_property PACKAGE_PIN E19 [get_ports led1]
set_property PACKAGE_PIN U19 [get_ports led2]
set_property IOSTANDARD LVCMOS33 [get_ports {led0 led1 led2}]

# buttons
set_property PACKAGE_PIN U18 [get_ports rst]
set_property IOSTANDARD LVCMOS33 [get_ports rst]