## Generated SDC file "temporizacao_processador.sdc"

## Copyright (C) 2018  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

## DATE    "Sun Dec 17 17:14:34 2023"

##
## DEVICE  "EP4CE6E22C6"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk_in} -period 10.000 -waveform { 0.000 5.000 } [get_ports {clock}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk_in}]  0.100 [get_ports {clock}]
set_input_delay -add_delay  -clock [get_clocks {clk_in}]  0.100 [get_ports {reset}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {data_uc}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[8]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[9]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[10]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[11]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[12]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[13]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[14]}]
set_output_delay -add_delay  -clock [get_clocks {clk_in}]  1.000 [get_ports {dout[15]}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************

set_false_path -from [get_clocks *] -through [get_pins {inst_datapath|inst_pilha|indice[1]|clk inst_datapath|inst_pilha|indice[0]|clk inst_datapath|inst_pilha|indice[2]|clk}]  -to [get_clocks {clk_in}]

set_false_path -from [get_pins {UC:inst_UC|clock_pilha}]
set_false_path -from [get_pins {UC:inst_UC|estado_atual.Aritmetica6}]
set_false_path -from [get_pins {UC:inst_UC|estado_atual.Aritmetica2}]
set_false_path -from [get_pins {UC:inst_UC|clock_rom}]
set_false_path -from [get_pins {UC:inst_UC|estado_atual.Decodificar}]
set_false_path -from [get_pins {UC:inst_UC|estado_atual.Aritmetica5}]
set_false_path -from [get_pins {UC:inst_UC|clock_temp1}]
set_false_path -from [get_pins {UC:inst_UC|opcode[0]}]
set_false_path -from [get_pins {UC:inst_UC|clock_ram}]
#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

