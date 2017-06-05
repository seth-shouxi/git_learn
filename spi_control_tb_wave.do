onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /spi_control_tb/uut/i_clk
add wave -noupdate /spi_control_tb/uut/i_rst
add wave -noupdate /spi_control_tb/uut/data_in
add wave -noupdate /spi_control_tb/uut/i_cs
add wave -noupdate /spi_control_tb/uut/i_sclk
add wave -noupdate /spi_control_tb/uut/i_mosi
add wave -noupdate /spi_control_tb/uut/transmit_state
add wave -noupdate /spi_control_tb/uut/transmit_cnt
add wave -noupdate /spi_control_tb/uut/rec_done
add wave -noupdate /spi_control_tb/uut/transmit_done
add wave -noupdate /spi_control_tb/uut/channel_num
add wave -noupdate /spi_control_tb/uut/rec_data
add wave -noupdate /spi_control_tb/uut/o_miso
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {148744343 ps} 0}
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
WaveRestoreZoom {0 ps} {315 us}
