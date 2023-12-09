onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_datapath/reset
add wave -noupdate /TB_datapath/wren
add wave -noupdate /TB_datapath/controle_pilha
add wave -noupdate /TB_datapath/clk_pilha
add wave -noupdate /TB_datapath/clk_temp2
add wave -noupdate /TB_datapath/load_temp2
add wave -noupdate /TB_datapath/load_temp1
add wave -noupdate /TB_datapath/clk_temp1
add wave -noupdate -radix hexadecimal /TB_datapath/din_UC
add wave -noupdate -radix decimal /TB_datapath/opcode
add wave -noupdate -radix hexadecimal /TB_datapath/dout
add wave -noupdate -radix decimal /TB_datapath/tos
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70440 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {19200 ps} {83200 ps}
