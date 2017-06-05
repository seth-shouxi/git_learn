//   ==================================================================
//   Copyright (c) 2017 by pimax Corporation
//   ALL RIGHTS RESERVED 
//   ------------------------------------------------------------------
//
//   Permission:
//
//
//
//   Disclaimer:
//
//
//
//	 writen by seth
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------


`timescale 1 ns / 1 ps

module spi_control(
				  input         	i_clk,
			//	  input         	i_rst,
				  
				  input         	i_cs,				  
				  input         	i_sclk,	
				  input         	i_mosi,
				  output        	o_miso
	
    );
	
	wire rst;

	reg	[1:0]	transmit_state;	
	reg	[2:0]	transmit_cnt;

	wire		rec_done;
	wire		transmit_done;
	
	reg	[15:0]	data_in;
	reg	[4:0]	channel_num;
	
	wire [15:0]	rec_data;
	
	//transmit state control 
    always @(posedge i_clk or posedge rst) begin
        if(rst) begin
            transmit_state <= 0;
            transmit_cnt <=	0;           
            channel_num <= 0;           
            data_in <= 0;           
        end else begin            
            case(transmit_state) 
				0	:	begin
					transmit_cnt <=	0;
					if(rec_done)
						if(rec_data[15:8] == 8'hf0) begin
							transmit_state <= 1;							
							channel_num <= rec_data[4:0];	
							data_in <= 16'h89ab; 
						end
					//	8'hf1 write 
				end
				1	:	begin
					if(rec_done)
						data_in <= data_in + 16'h1111;
						
					if(transmit_done) begin
						if(transmit_cnt == 4)//consider first transmit
							transmit_state <= 0;							
						else
							transmit_cnt <= transmit_cnt + 1;		
					end
				end
			
				default	:	begin
						transmit_state <= 0;
						transmit_cnt <=	0;						
				end
			endcase
			         
        end 
    end 	
	
	
	inner_rst inner_rst_u0(                   
				   .i_clk(i_clk),
				   .rst(rst)
					);
	
	spi_slave spi_slave_u0 (
		.i_clk(i_clk), 
		.i_rst(rst), 
		.i_cs(i_cs), 
		.i_sclk(i_sclk), 
		.i_mosi(i_mosi), 
		.o_miso(o_miso), 
		.rec_done(rec_done), 
		.transmit_done(transmit_done), 
		.data_in(data_in),
		.rec_data(rec_data)
		
	);
	
	

endmodule
