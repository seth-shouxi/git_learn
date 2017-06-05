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
# spi_control_tb.do
# Create work library
#
quit -sim
vlib work
#
# Compile sources
#

#vlog  "ipcore_dir/FIFO.v"

vlog  "spi_control.v"
vlog  "spi_slave.v"
vlog  "spi_control_tb.v"

#
# Call vsim to invoke simulator
#
vsim -voptargs="+acc" -t 1ps  -lib work work.spi_control_tb 
#
# Source the wave do file
#
do {spi_control_tb_wave.do}
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
run 0.3ms
#
# End
#
