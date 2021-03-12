

# For DIC_II in 2016 Fall:

# The  reset_design  command  removes  all  user-specified  clocks,  path
# groups, and attributes from the current design, except those defined by
# using the set_attribute command.  

# set current_design_name [current_design]

reset_design

remove_design -designs

set top_design mux161

lappend search_path "/pkgs/synopsys/2016/libs/SAED32_EDK/lib/stdcell_hvt/db_nldm"

set link_library   "saed32hvt_ff0p95v125c.db"

set target_library "saed32hvt_ff0p95v125c.db"

# set_clock_gating_style -sequential_cell latch -positive_edge_logic {and} -negative_edge_logic {or} -minimum_bitwidth 2

analyze -format sverilog /u/pratik2/Floorplan-based-synthesis/syn/scripts/mux161.sv

elaborate mux161

#create_clock -name "CLK" -period 0.500 -waveform {0.0 0.250} clock 

#set_clock_transition 0.100 CLK

echo "Message: Compiling the design now:"
echo "========================="

# compile -gate_clock

compile

compile_ultra


echo "Message: Compiling Ended now:"
echo "========================="

write_file  -f verilog -h -o /u/pratik2/Floorplan-based-synthesis/syn/scripts/mux161_be.v
#write_file  -f verilog -h -o /u/pratik2/work/QUESTA_SIM_FE_BE/back_end/Adder_be.v 

# write_file  -f ddc -h -o     /u/ataur/DIC_II_SNPS/DC/output/mapped/counter_questa.ddc
# write_sdc   -nosplit /home/ataur/DIC_II_SNPS/DC/output/mapped/counter_questa.sdc

report_cell -nosplit
