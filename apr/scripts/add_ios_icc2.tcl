# ========================================================================
# ICC2 Pin/Port Placement Constraints Configuration for ORCA_TOP
# ========================================================================

# Clear any default or pre-existing pin assignments
remove_block_pin_constraints -all

# Assign Pins to the LEFT SIDE (Side 1) - SDRAM Data & Operations
# logic for sd_DQ, sd_A, and standard controls)
set left_ports [get_ports {sd_DQ[*] sd_A[*] sd_BA[*] sd_CS_n sd_WE_n sd_RAS_n sd_CAS_n sd_CKE sd_CLK sd_LDQM sd_UDQM}]
set_block_pin_constraints -side 1 -allowed_layers {M3 M4} $left_ports

# Assign Pins to the TOP SIDE (Side 2) - Clocks, Resets, and JTAG
# pclk, prst_n, and sys_clk inputs
set top_ports [get_ports {pclk prst_n sys_clk scan_en test_mode TRST TMS TCK TDI TDO}]
set_block_pin_constraints -side 2 -allowed_layers {M3 M4} $top_ports

# Assign Pins to the RIGHT SIDE (Side 3) - Peripheral Interface Bus
# pcfg, penable, psel, paddr, and pwrite structures
set right_ports [get_ports {pcfg[*] penable psel paddr[*] pwrite pwdata[*] prdata[*]}]
set_block_pin_constraints -side 3 -allowed_layers {M3 M4} $right_ports

# Assign Pins to the BOTTOM SIDE (Side 4) - Miscellaneous and Interrupts
# external interrupt lines and status flags
set bottom_ports [get_ports {ext_int[*] error_flag status[*]}]
set_block_pin_constraints -side 4 -allowed_layers {M3 M4} $bottom_ports


# Execute the ICC2 Global Pin Placer Engine
place_pins -self


# ========================================================================
# NOTE
# -allowed_layers {M3 M4}
# this specify preferred routing layers for IOs ensures that the clock trees and mesh architectures we construct later have clean, unobstructed access to upper metal layers.