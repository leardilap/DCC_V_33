onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/OSC_50
add wave -noupdate -radix decimal -childformat {{{/DCC_V_33_TB/UUT_DCC_V_33/LEDG[8]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/LEDG[7]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/LEDG[6]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/LEDG[5]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/LEDG[4]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/LEDG[3]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/LEDG[2]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/LEDG[1]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/LEDG[0]} -radix decimal}} -expand -subitemconfig {{/DCC_V_33_TB/UUT_DCC_V_33/LEDG[8]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/LEDG[7]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/LEDG[6]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/LEDG[5]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/LEDG[4]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/LEDG[3]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/LEDG[2]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/LEDG[1]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/LEDG[0]} {-height 15 -radix decimal}} /DCC_V_33_TB/UUT_DCC_V_33/LEDG
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/LEDR
add wave -noupdate -radix decimal -childformat {{{/DCC_V_33_TB/UUT_DCC_V_33/KEY[3]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/KEY[2]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/KEY[1]} -radix decimal} {{/DCC_V_33_TB/UUT_DCC_V_33/KEY[0]} -radix decimal}} -expand -subitemconfig {{/DCC_V_33_TB/UUT_DCC_V_33/KEY[3]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/KEY[2]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/KEY[1]} {-height 15 -radix decimal} {/DCC_V_33_TB/UUT_DCC_V_33/KEY[0]} {-height 15 -radix decimal}} /DCC_V_33_TB/UUT_DCC_V_33/KEY
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/SW
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/ADA_D
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/ADA_DCO
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/ADA_OE
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/ADA_OR
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/ADA_SPI_CS
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/ADB_D
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/ADB_DCO
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/ADB_OE
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/ADB_OR
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/ADB_SPI_CS
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/DA
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/DB
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/FPGA_CLK_A_N
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/FPGA_CLK_A_P
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/FPGA_CLK_B_N
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/FPGA_CLK_B_P
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/XT_IN_N
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/XT_IN_P
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/reset_n
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/sys_clk
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/sys_clk_90deg
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/sys_clk_180deg
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/sys_clk_270deg
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/pll_locked
add wave -noupdate -format Analog-Step -height 74 -max 4095.0 -min -4096.0 -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/i_sine1
add wave -noupdate -format Analog-Step -height 74 -max 4095.0 -min -4096.0 -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/is_sine1
add wave -noupdate -format Analog-Step -height 74 -max 8191.0 -radix unsigned /DCC_V_33_TB/UUT_DCC_V_33/iu_sine1
add wave -noupdate -format Analog-Step -height 74 -max 1800.0 -min -600.0 -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/i_sine10
add wave -noupdate -format Analog-Step -height 74 -max 1800.0 -min -600.0 -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/is_sine10
add wave -noupdate -format Analog-Step -height 74 -max 8191.0 -radix unsigned /DCC_V_33_TB/UUT_DCC_V_33/iu_sine10
add wave -noupdate -format Analog-Step -height 74 -max 16383.0 -radix unsigned /DCC_V_33_TB/UUT_DCC_V_33/o_sine
add wave -noupdate -format Analog-Step -height 74 -max 16383.0 -radix unsigned /DCC_V_33_TB/UUT_DCC_V_33/o_sine_p
add wave -noupdate -format Analog-Step -height 74 -max 16383.0 -radix unsigned /DCC_V_33_TB/UUT_DCC_V_33/o_sine_n
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/per_a2da_d
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/per_a2db_d
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/a2da_data
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/a2db_data
add wave -noupdate -radix unsigned /DCC_V_33_TB/UUT_DCC_V_33/count
add wave -noupdate -radix unsigned /DCC_V_33_TB/UUT_DCC_V_33/cnt1
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/dir1
add wave -noupdate -radix unsigned /DCC_V_33_TB/UUT_DCC_V_33/cnt10
add wave -noupdate -radix decimal /DCC_V_33_TB/UUT_DCC_V_33/dir10
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {19870000000 fs} 0}
quietly wave cursor active 1
configure wave -namecolwidth 197
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {31876710400 fs} {95630131200 fs}
