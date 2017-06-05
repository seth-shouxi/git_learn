onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /spi_slave_tb/uut/i_clk
add wave -noupdate /spi_slave_tb/uut/i_rst
add wave -noupdate /spi_slave_tb/uut/data_in
add wave -noupdate /spi_slave_tb/uut/channel_num
add wave -noupdate /spi_slave_tb/uut/cs
add wave -noupdate -color Gold /spi_slave_tb/uut/i_sclk
add wave -noupdate /spi_slave_tb/uut/i_mosi
add wave -noupdate /spi_slave_tb/uut/transmit_cnt
add wave -noupdate /spi_slave_tb/uut/s_posedge
add wave -noupdate -radix binary /spi_slave_tb/uut/rec_shift
add wave -noupdate /spi_slave_tb/uut/rec_data
add wave -noupdate -color Gold /spi_slave_tb/uut/rec_done
add wave -noupdate -radix unsigned /spi_slave_tb/uut/rec_bit_cnt
add wave -noupdate /spi_slave_tb/uut/s_negedge
add wave -noupdate -radix unsigned /spi_slave_tb/uut/transmit_bit_cnt
add wave -noupdate /spi_slave_tb/uut/transmit_shift
add wave -noupdate /spi_slave_tb/uut/o_miso
add wave -noupdate -color Gold /spi_slave_tb/uut/transmit_done
add wave -noupdate /spi_slave_tb/uut/transmit_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {90424165 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 182
configure wave -valuecolwidth 134
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
WaveRestoreZoom {0 ps} {210 us}
