onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_Pilha/clk
add wave -noupdate /TB_Pilha/rst
add wave -noupdate /TB_Pilha/wren
add wave -noupdate /TB_Pilha/controle_pilha
add wave -noupdate -radix octal -childformat {{{/TB_Pilha/din_UC[15]} -radix decimal} {{/TB_Pilha/din_UC[14]} -radix decimal} {{/TB_Pilha/din_UC[13]} -radix decimal} {{/TB_Pilha/din_UC[12]} -radix decimal} {{/TB_Pilha/din_UC[11]} -radix decimal} {{/TB_Pilha/din_UC[10]} -radix decimal} {{/TB_Pilha/din_UC[9]} -radix decimal} {{/TB_Pilha/din_UC[8]} -radix decimal} {{/TB_Pilha/din_UC[7]} -radix decimal} {{/TB_Pilha/din_UC[6]} -radix decimal} {{/TB_Pilha/din_UC[5]} -radix decimal} {{/TB_Pilha/din_UC[4]} -radix decimal} {{/TB_Pilha/din_UC[3]} -radix decimal} {{/TB_Pilha/din_UC[2]} -radix decimal} {{/TB_Pilha/din_UC[1]} -radix decimal} {{/TB_Pilha/din_UC[0]} -radix decimal}} -subitemconfig {{/TB_Pilha/din_UC[15]} {-radix decimal} {/TB_Pilha/din_UC[14]} {-radix decimal} {/TB_Pilha/din_UC[13]} {-radix decimal} {/TB_Pilha/din_UC[12]} {-radix decimal} {/TB_Pilha/din_UC[11]} {-radix decimal} {/TB_Pilha/din_UC[10]} {-radix decimal} {/TB_Pilha/din_UC[9]} {-radix decimal} {/TB_Pilha/din_UC[8]} {-radix decimal} {/TB_Pilha/din_UC[7]} {-radix decimal} {/TB_Pilha/din_UC[6]} {-radix decimal} {/TB_Pilha/din_UC[5]} {-radix decimal} {/TB_Pilha/din_UC[4]} {-radix decimal} {/TB_Pilha/din_UC[3]} {-radix decimal} {/TB_Pilha/din_UC[2]} {-radix decimal} {/TB_Pilha/din_UC[1]} {-radix decimal} {/TB_Pilha/din_UC[0]} {-radix decimal}} /TB_Pilha/din_UC
add wave -noupdate -radix decimal /TB_Pilha/din_ULA
add wave -noupdate -radix decimal /TB_Pilha/dout
add wave -noupdate -radix decimal /TB_Pilha/tos
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {14747 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 198
configure wave -valuecolwidth 108
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {22133 ps}
