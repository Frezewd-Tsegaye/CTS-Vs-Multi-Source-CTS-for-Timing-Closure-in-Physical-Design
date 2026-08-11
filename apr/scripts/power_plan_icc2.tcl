##############################################################################
# ORCA_TOP ICC2 Power Planning
##############################################################################

source -echo -verbose ../../common/ORCA_TOP.design_config.tcl

# Open design
#open_lib ORCA_TOP_lib
#open_block ORCA_TOP_lib:ORCA_TOP/after_floorplan

##############################################################################
# Connect PG nets to all cell pins and top-level ports
# This wires up every cell's VDD/VSS/VDDH pin to the actual supply nets.
# Must be done before creating the physical power grid.
# -hierarchical: searches through all levels of the design hierarchy
# -quiet: suppresses warnings for pins that don't exist on some cells
##############################################################################

puts "INFO: Connecting PG nets..."

# Connect internal cell pins
#connect_pg_net -net VDD  [get_pins -hierarchical "*/VDD"  -quiet]
#connect_pg_net -net VSS  [get_pins -hierarchical "*/VSS"  -quiet]
#connect_pg_net -net VDDH [get_pins -hierarchical "*/VDDH" -quiet]

# Connect top-level chip boundary ports
#connect_pg_net -net VDD  [get_ports VDD  -quiet]
#connect_pg_net -net VSS  [get_ports VSS  -quiet]
#connect_pg_net -net VDDH [get_ports VDDH -quiet]

connect_pg_net -automatic 

puts "INFO: PG nets connected."

##############################################################################
# Create Core Power Ring
# Creates a VDD/VSS ring around the entire core boundary.
# M8 used for horizontal ring segments (top/bottom of core)
# M9 used for vertical ring segments (left/right of core)
# Width: 2.0um — wide enough for IR drop requirements at 32nm
# Spacing: 0.8um between VDD and VSS ring wires
# Offset: 2.0um inward from the core edge
##############################################################################

puts "INFO: Creating core power ring..."

create_pg_ring_pattern ring_pattern \
    -horizontal_layer M8 \
    -horizontal_width  2.0 \
    -horizontal_spacing 0.8 \
    -vertical_layer    M9 \
    -vertical_width    2.0 \
    -vertical_spacing  0.8

set_pg_strategy core_ring \
    -core \
    -pattern {{name: ring_pattern} \
              {nets: {VDD VSS}} \
              {offset: {2.0 2.0}}}

compile_pg -strategies core_ring

puts "INFO: Core power ring created."

##############################################################################
# Create Power Straps across core
#
# Creates a power mesh grid across the entire core area.
# Horizontal straps on M7, vertical straps on M8.
# Together they form a grid so every part of the core is
# close to a power strap — reducing IR drop across the chip.
#
# Parameters:
#   width:  1.0um — strap wire width
#   spacing: 0.5um — between VDD and VSS straps
#   pitch:  20.0um — distance between repeated VDD-VSS pairs
#   offset:  5.0um — first strap starts 5um from core edge
##############################################################################
puts "INFO: Creating power straps..."

# Horizontal straps on M7
create_pg_mesh_pattern strap_h \
    -layers { \
        {{horizontal_layer: M7} \
         {width: 1.0} \
         {spacing: 0.5} \
         {pitch: 20.0} \
         {offset: 5.0} \
         {trim: true}} \
    }

# Vertical straps on M8
create_pg_mesh_pattern strap_v \
    -layers { \
        {{vertical_layer: M8} \
         {width: 1.0} \
         {spacing: 0.5} \
         {pitch: 20.0} \
         {offset: 5.0} \
         {trim: true}} \
    }

set_pg_strategy straps_h \
    -core \
    -pattern {{name: strap_h} {nets: {VDD VSS}}}

set_pg_strategy straps_v \
    -core \
    -pattern {{name: strap_v} {nets: {VDD VSS}}}

compile_pg -strategies {straps_h straps_v}

puts "INFO: Power straps created."

##############################################################################
# Connect standard cell rails (M1)
# rails running through every single placement row across the core.
# Every standard cell connects its power pins directly to these rails.
# Without this step, standard cells cannot be powered and place_opt
# will fail or produce incorrect results.
##############################################################################

puts "INFO: Connecting standard cell rails..."

create_pg_std_cell_conn_pattern std_rail_pattern \
    -layers {M1}

set_pg_strategy std_rails \
    -core \
    -pattern {{name: std_rail_pattern} {nets: {VDD VSS}}}

compile_pg -strategies std_rails

puts "INFO: Standard cell rails created."

##############################################################################
# Verify power grid
#
# check_pg_connectivity: verifies all power nets are properly connected
#   -check_std_cell_pins none: skips individual cell pin checks
#   (std cells not placed yet so this is expected)
#
# check_pg_drc: checks power grid for metal width/spacing violations
#
# report_pg_supply_conversion: reports how well the power grid covers
#   the core area and supply distribution quality
##############################################################################

puts "INFO: Verifying power grid..."

check_pg_connectivity -check_std_cell_pins none
check_pg_drc

puts "INFO: Power grid verification complete."

##############################################################################
# Save block
##############################################################################

save_block -label after_power
save_lib ORCA_TOP_lib

puts "INFO: Power planning complete — block saved as after_power"

