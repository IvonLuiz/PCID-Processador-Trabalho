# Generated SDC file for processador_blocos module

#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period 10 [get_ports clock] -name clk_in
create_clock -period 10 [get_ports clk_pilha] -name clk_pilha

#**************************************************************
# Set Input Delay
#**************************************************************

# Assuming some input delay, adjust as needed
set_input_delay -clock [get_clocks clk_in] -min 0.5 [get_ports reset]
set_input_delay -clock [get_clocks clk_in] -max 1.0 [get_ports reset]

#**************************************************************
# Set Output Delay
#**************************************************************

# Assuming some output delay, adjust as needed
set_output_delay -clock [get_clocks clk_in] -min 0.5 [get_pins b2v_inst_datapath/dout]
set_output_delay -clock [get_clocks clk_in] -max 1.0 [get_pins b2v_inst_datapath/dout]

#**************************************************************
# Set Clock Groups
#**************************************************************

# Assuming synchronous design, adjust as needed
# set_clock_groups -asynchronous -group [get_clocks clk_in] -group [get_clocks -all -exclude [get_clocks clk_in]]

#**************************************************************
# Set False Path
#**************************************************************

# Assuming no false path constraints, add as needed
set_false_path -from [get_pins b2v_inst_datapath/din_UC] -to [get_pins b2v_inst_UC/data_pilha]

#**************************************************************
# Set Multicycle Path
#**************************************************************

# Assuming no multicycle path constraints, add as needed
set_multicycle_path -from [get_pins b2v_inst_UC/data_pilha] -to [get_pins b2v_inst_datapath/din_UC] 2 -setup
set_multicycle_path -from [get_pins b2v_inst_UC/data_pilha] -to [get_pins b2v_inst_datapath/din_UC] 1 -hold

#**************************************************************
# Set Maximum Delay
#**************************************************************

# Assuming no maximum delay constraints, add as needed
set_max_delay -from [get_ports reset] -to [get_pins b2v_inst_UC/data_pilha] 5.0

#**************************************************************
# Set Minimum Delay
#**************************************************************

# Assuming no minimum delay constraints, add as needed
set_min_delay -from [get_ports reset] -to [get_pins b2v_inst_UC/data_pilha] 2.0

#**************************************************************
# Set Input Transition
#**************************************************************

# Assuming no input transition constraints, add as needed
set_input_transition -clock [get_clocks clk_in] -max 2.0 [get_ports reset]

# #**************************************************************
# # End of SDC file
# #**************************************************************
