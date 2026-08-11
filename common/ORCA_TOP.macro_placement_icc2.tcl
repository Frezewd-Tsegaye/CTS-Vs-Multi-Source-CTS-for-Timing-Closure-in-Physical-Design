# ========================================================================
# ORCA_TOP Macro Placement
# ========================================================================

echo "INFO: Initializing ICC2 Macro placement..."

#  unplace all hard macros to ensure a clean slate
#set hard_macros [get_cells -hierarchical -filter "is_hard_macro==true"]
#if {[sizeof_collection $hard_macros] > 0} {
    #set_cell_status -status unplaced $hard_macros
#    remove_fixed_objects $hard_macros
#}

# Apply Coordinates and Orientations

# ── I_RISC_CORE — 4 x SRAM2RW128x16 ─────────────────────────────────────
move_objects [get_cells I_RISC_CORE/I_REG_FILE_REG_FILE_A_RAM] -to {145.7 482.4}
set_attribute [get_cells I_RISC_CORE/I_REG_FILE_REG_FILE_A_RAM] orientation R90

move_objects [get_cells I_RISC_CORE/I_REG_FILE_REG_FILE_B_RAM] -to {291.4 482.4}
set_attribute [get_cells I_RISC_CORE/I_REG_FILE_REG_FILE_B_RAM] orientation R90

move_objects [get_cells I_RISC_CORE/I_REG_FILE_REG_FILE_C_RAM] -to {145.7 389.8}
set_attribute [get_cells I_RISC_CORE/I_REG_FILE_REG_FILE_C_RAM] orientation R90

move_objects [get_cells I_RISC_CORE/I_REG_FILE_REG_FILE_D_RAM] -to {291.4 389.8}
set_attribute [get_cells I_RISC_CORE/I_REG_FILE_REG_FILE_D_RAM] orientation R90

# ── I_PCI_TOP — 8 x SRAM2RW32x4 READ FIFOs ──────────────────────────────
move_objects [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_1] -to {5.0 270.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_1] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_2] -to {70.0 270.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_2] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_3] -to {5.0 205.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_3] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_4] -to {70.0 205.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_4] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_5] -to {5.0 140.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_5] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_6] -to {70.0 140.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_6] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_7] -to {5.0 75.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_7] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_8] -to {70.0 75.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_READ_FIFO_PCI_FIFO_RAM_8] orientation R0

 
# ── I_PCI_TOP — 8 x SRAM2RW32x4 WRITE FIFOs ─────────────────────────────
move_objects [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_1] -to {135.0 270.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_1] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_2] -to {135.0 205.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_2] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_3] -to {135.0 140.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_3] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_4] -to {135.0 75.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_4] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_5] -to {5.0 10.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_5] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_6] -to {70.0 10.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_6] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_7] -to {135.0 10.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_7] orientation R0

move_objects [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_8] -to {200.0 10.0}
set_attribute [get_cells I_PCI_TOP/I_PCI_WRITE_FIFO_PCI_FIFO_RAM_8] orientation R0

 
# ── I_CONTEXT_MEM — 16 x SRAM2RW64x8 ────────────────────────────────────
move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_0_1] -to {349.3 487.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_0_1] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_0_2] -to {349.3 400.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_0_2] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_0_3] -to {425.3 487.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_0_3] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_0_4] -to {425.3 400.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_0_4] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_1_1] -to {501.3 487.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_1_1] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_1_2] -to {501.3 400.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_1_2] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_1_3] -to {577.3 487.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_1_3] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_1_4] -to {577.3 400.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_1_4] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_2_1] -to {653.3 487.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_2_1] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_2_2] -to {653.3 400.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_2_2] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_2_3] -to {729.3 487.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_2_3] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_2_4] -to {729.3 400.9}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_2_4] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_3_1] -to {653.3 310.0}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_3_1] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_3_2] -to {729.3 310.0}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_3_2] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_3_3] -to {653.3 220.0}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_3_3] orientation R0

move_objects [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_3_4] -to {729.3 220.0}
set_attribute [get_cells I_CONTEXT_MEM/I_CONTEXT_RAM_3_4] orientation R0

 
# ── I_SDRAM_TOP — 4 x SRAM2RW64x32 ──────────────────────────────────────
move_objects [get_cells I_SDRAM_TOP/I_SDRAM_WRITE_FIFO_SD_FIFO_RAM_0] -to {525.0 110.0}
set_attribute [get_cells I_SDRAM_TOP/I_SDRAM_WRITE_FIFO_SD_FIFO_RAM_0] orientation R0

move_objects [get_cells I_SDRAM_TOP/I_SDRAM_WRITE_FIFO_SD_FIFO_RAM_1] -to {525.0 10.0}
set_attribute [get_cells I_SDRAM_TOP/I_SDRAM_WRITE_FIFO_SD_FIFO_RAM_1] orientation R0

move_objects [get_cells I_SDRAM_TOP/I_SDRAM_READ_FIFO_SD_FIFO_RAM_0] -to {663.6 110.0}
set_attribute [get_cells I_SDRAM_TOP/I_SDRAM_READ_FIFO_SD_FIFO_RAM_0] orientation R0

move_objects [get_cells I_SDRAM_TOP/I_SDRAM_READ_FIFO_SD_FIFO_RAM_1] -to {663.6 10.0}
set_attribute [get_cells I_SDRAM_TOP/I_SDRAM_READ_FIFO_SD_FIFO_RAM_1] orientation R0
 


set hard_macros [get_cells -hierarchical -filter "is_hard_macro==true"]
# Lock all macro locations to prevent legalizer displacement
if {[sizeof_collection $hard_macros] > 0} {
    #set_cell_status -status fixed $hard_macros
    set_fixed_objects $hard_macros
    echo "INFO: Successfully placed and locked [sizeof_collection $hard_macros] hard macros."
}
