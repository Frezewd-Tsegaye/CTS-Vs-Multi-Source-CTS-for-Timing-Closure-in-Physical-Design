# ========================================================================
# Physically placing IO pad cells
# ========================================================================

echo "INFO: Starting ICC2 physical pad constraint mapping..."

# Clear any old pad assignment data from the database
remove_pad_physical_constraints -all

# Map LEFT side pads 
set left_pad_cells [get_cells -quiet io_l*]
if {[sizeof_collection $left_pad_cells] > 0} {
    set_pad_physical_constraints -side 1 $left_pad_cells
    echo "INFO: Constrained [sizeof_collection $left_pad_cells] pads to the LEFT (Side 1)"
}

# Map TOP side pads 
set top_pad_cells [get_cells -quiet io_t*]
if {[sizeof_collection $top_pad_cells] > 0} {
    set_pad_physical_constraints -side 2 $top_pad_cells
    echo "INFO: Constrained [sizeof_collection $top_pad_cells] pads to the TOP (Side 2)"
}

# Map RIGHT side pads 
set right_pad_cells [get_cells -quiet io_r*]
if {[sizeof_collection $right_pad_cells] > 0} {
    set_pad_physical_constraints -side 3 $right_pad_cells
    echo "INFO: Constrained [sizeof_collection $right_pad_cells] pads to the RIGHT (Side 3)"
}

# Map BOTTOM side pads 
set bottom_pad_cells [get_cells -quiet io_b*]
if {[sizeof_collection $bottom_pad_cells] > 0} {
    set_pad_physical_constraints -side 4 $bottom_pad_cells
    echo "INFO: Constrained [sizeof_collection $bottom_pad_cells] pads to the BOTTOM (Side 4)"
}


# 6. Legalize and snap the IO pads to their physical locations
echo "INFO: Executing Synopsys IO Placer Engine..."
place_io

echo "INFO: Physical Pad Placement initialization complete."