##############################################################
# ORCA_TOP ICC2 — Placement
##############################################################

source -echo -verbose ../../common/ORCA_TOP.design_config.tcl

# Open library 
# open_lib ORCA_TOP_lib
# open_block ORCA_TOP_lib:ORCA_TOP/after_power

# Pre-placement settings
# Set routing layers — M2 to M9 for SAED32 1P9M
set_ignored_layers -min_routing_layer M2 -max_routing_layer M9

# Set placement effort
set_app_options -name place.coarse.auto_density_control \
    -value true

# Disable MV
#set_app_options -name mv.check_mv_design -value false

# Run placement + optimization
# place_opt does:
#   1. Global placement
#   2. Legalization (snaps cells to rows)
#   3. Timing-driven optimization
#   4. Pre-CTS useful skew
puts "INFO: Running place_opt..."
place_opt

# Check placement 
puts "INFO: Checking placement..."
check_placement 

# Reports
# report_timing \
    #-scenarios [all_scenarios] \
    #-max_paths 10 \
    #> ../outputs/ORCA_TOP.place.timing.rpt

#report_qor \
    #> ../outputs/ORCA_TOP.place.qor.rpt

# All Reports
report_qor > ../reports/${top_design}.place.qor.rpt
report_clock_qor > ../reports/${top_design}.place.clock_qor.rpt
report_constraint -nosplit -all_viol > ../reports/${top_design}.place.constraint.rpt
report_timing -nosplit -delay max -input -tran -cross -sig 4 -derate -net -cap  -path full_clock_expanded -max_path 1000 -slack_less 0 > ../reports/${top_design}.place.timing.max.full_clock.rpt
exec gzip -f ../reports/${top_design}.place.timing.max.full_clock.rpt
	report_timing -nosplit -delay max -input -tran -cross -sig 4 -derate -net -cap  -max_path 1000 -slack_less 0 > ../reports/${top_design}.$stage.timing.max.rpt
exec gzip -f ../reports/${top_design}.place.timing.max.rpt

# Print summary to log
report_timing -scenarios [all_scenarios] -max_paths 5
report_qor -summary

# Save
save_block -label after_place
save_lib ORCA_TOP_lib

puts "INFO: Placement complete"

