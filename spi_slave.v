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
// cs selects the chip - useful to select one among multiple slaves
// It is also used as asynchronous reset
// i_sclk is the master driven clock.

`timescale 1 ns / 1 ps
 
module spi_slave(
					// System clock 
					// asynchronous active high reset 
				  input         	i_clk,
				  input         	i_rst,
				  
				  input         	i_cs,				 
				  input         	i_sclk,	
				  input         	i_mosi,
				  output reg       	o_miso,
				  output reg       	rec_done,
				  output reg       	transmit_done,
				  input	[15:0]		data_in,
				  output reg[15:0]	rec_data
				 			  
			//	  input         	i_cpol	// set  0
			//	  input         	i_cpha	// set  0
    );
	
	reg		s_posedge,s_negedge;
	reg		sclk_del1,sclk_del2,sclk_del3;
	reg		cs_del1,cs;
	reg		mosi_del1,mosi;
	//synchronization
	always @(posedge i_clk or posedge i_rst) begin
        if(i_rst) begin
            sclk_del1 <= 1'b0;
            sclk_del2 <= 1'b0;
            sclk_del3 <= 1'b0;          
            s_posedge <= 1'b0; 
            s_negedge <= 1'b0; 
			cs_del1 <= 1'b0;          
            cs <= 1'b0; 
            mosi_del1 <= 1'b0; 
            mosi <= 1'b0; 
        end else begin            
            sclk_del1 <= i_sclk;      
            sclk_del2 <= sclk_del1; 
			sclk_del3 <= sclk_del2;
			s_posedge <= sclk_del2 && (~sclk_del3);
			s_negedge <= (~sclk_del2) && (sclk_del3);
			cs_del1 <= i_cs;      
            cs <= cs_del1;
            mosi_del1 <= i_mosi;
            mosi <= mosi_del1;			
        end 
    end	
	
	reg	[4:0]	rec_bit_cnt;
	reg	[15:0]	rec_shift;
	
		//Accepting data from the MOSI line	
		//Reading at positive edge (CPOL = '0' and CPHA = '0', CPOL = '1', CPHA = '1')
	always @(posedge i_clk or posedge i_rst) begin
        if(i_rst) begin
            rec_bit_cnt <= 0;
            rec_shift <= 0; 
        end else begin
			if(cs == 0) begin
				if(rec_bit_cnt == 16)
					rec_bit_cnt <= 0;
				else begin
					if(s_posedge) begin
						rec_bit_cnt <= rec_bit_cnt + 1;				
						rec_shift <= {{rec_shift[14:0]},mosi};
					end
				end				 									
			end	else begin
				rec_bit_cnt <= 0;
				rec_shift <= 0;				
			end
        end 
    end 		
	
	//receive flags	
	always @(posedge i_clk or posedge i_rst) begin
        if(i_rst) begin
            rec_done <= 1'b0;   
            rec_data <= 0; 					
        end else begin  
			if(rec_bit_cnt == 16)begin
				rec_done <= 1'b1;
				rec_data <= rec_shift;				
			end else begin
				rec_done <= 1'b0;
			end
            
        end 
    end 
		
	reg	[4:0]	transmit_bit_cnt;
	reg	[15:0]	transmit_shift;			
	//transmit data on the MISO line	
	always @(posedge i_clk or posedge i_rst) begin
        if(i_rst) begin
            transmit_bit_cnt <= 0;
            o_miso <= 0;			
			transmit_shift <= 0;
        end else begin 
			if(cs == 0) begin					
				if(transmit_bit_cnt == 16)begin//transmit_done
						transmit_bit_cnt <= 0;						
						transmit_shift <= {{data_in[14:0]},1'b0};
						o_miso <= data_in[15];
				end else begin
					if(s_negedge) begin
						transmit_bit_cnt <= transmit_bit_cnt + 1;				
						o_miso <= transmit_shift[15];
						transmit_shift[15:0] <= {{transmit_shift[14:0]},1'b0};
					end
					
				end			
			end else begin
				transmit_bit_cnt <= 0;
				o_miso <= data_in[15];
				transmit_shift <= {{data_in[14:0]},1'b0};
			end
        end 
    end 
	
	//transmit flags	
	always @(posedge i_clk or posedge i_rst) begin
        if(i_rst) begin
            transmit_done <= 1'b0; 
        end else begin  
			if(transmit_bit_cnt == 16)begin
				transmit_done <= 1'b1;				
			end else begin
				transmit_done <= 1'b0;
			end            
        end 
    end 	

endmodule
