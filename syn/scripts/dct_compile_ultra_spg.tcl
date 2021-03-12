
set top_design adder

source -echo -verbose ../../$top_design.design_config.tcl

# List all current designs
set this_design [ list_designs ]

# If there are existing designs reset/remove them
if { $this_design != 0 } {
  # To reset the earlier designs
  reset_design
  remove_design -designs
}

source ../scripts/dc-get-timlibs.tcl

source ../scripts/dct-getcreate-mwlib.tcl

# Analyzing the files for the design
analyze $rtl_list -autoread -define SYNTHESIS


# Elaborate the design
elaborate ${top_design}

if { [ info exists add_ios ] && $add_ios } {
   source -echo -verbose ../scripts/add_ios.tcl
   # Source the design dependent code that will put IOs on different sides
   source ../../$top_design.add_ios.tcl
}

change_names -rules verilog -hierarchy

# Comment the line below if no DEF is available.  Generic floorplan will be created.
extract_physical_constraints ../../apr/outputs/${top_design}.floorplan.def.gz
set_attribute [all_macro_cells] is_fixed true
source -echo -verbose ../../constraints/${top_design}.sdc


# Constrain the overall data path of the design.
# 50% or so of the clock period is good.
set_max_transition 0.5 [current_design ]
set_ignored_layers -min_routing_layer M2 -max_routing_layer M7


set_dont_use [get_lib_cells */DELLN* ]

uniquify




#create_placement_blockage -name def_obstuction_hard -bbox { 130 39 244 197 }
#create_placement_blockage -name def_obstuction_soft -bbox { 475 250 730 350 } -type soft
#create_placement_blockage -name def_obstuction_partial -bbox { 535 465 740 600 } -type partial -blocked_percentage 70

#create_wiring_keepouts -name def_wiring_keepouts -layer M4 -coordinate { 285 770 550 870 }

#create_bounds -coordinate {771 735 790 870} -name mb_soft -color cyan dff_a


compile_ultra  -scan -no_autoungroup

change_names -rules verilog -hierarchy

set stage dct
report_qor > ../reports/${top_design}.$stage.qor.rpt
report_constraint -all_viol > ../reports/${top_design}.$stage.constraint.rpt
report_timing -delay max -input -tran -cross -sig 4 -derate -net -cap  -max_path 10000 -slack_less 0 > ../reports/${top_design}.$stage.timing.max.rpt
check_timing  > ../reports/${top_design}.$stage.check_timing.rpt
check_design > ../reports/${top_design}.$stage.check_design.rpt
check_mv_design  > ../reports/${top_design}.$stage.mvrc.rpt

write -hier -format verilog -output ../outputs/${top_design}.$stage.vg
write -hier -format ddc -output ../outputs/${top_design}.$stage.ddc
write_def -blockages -macro -pins -output ../outputs/${top_design}.$stage.def
save_upf ../outputs/${top_design}.$stage.upf
write_def -scanchain -output ../outputs/${top_design}.$stage.scan.def

