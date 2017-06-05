##   ==================================================================
##   Copyright (c) 2017 by pimax Corporation
##   ALL RIGHTS RESERVED 
##   ------------------------------------------------------------------
##
##   Permission:
##
##
##
##   Disclaimer:
##
##
##
##	 writen by seth
##
######################################################################
# spi_slave_tb.do
# Create work library
#
quit -sim
vlib work
#
# Compile sources
#

#vlog  "ipcore_dir/FIFO.v"

vlog  "spi_slave.v"
vlog  "spi_slave_tb.v"

#
# Call vsim to invoke simulator
#
vsim -voptargs="+acc" -t 1ps  -lib work work.spi_slave_tb 
#
# Source the wave do file
#
do {spi_slave_tb_wave.do}
#
# Set the window types
#
view wave
view structure
view signals
#
# Source the user do file
#
#
# Run simulation for this time
#
run 0.2ms
#
# End
#
