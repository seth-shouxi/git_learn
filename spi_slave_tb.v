`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:19:54 05/11/2017
// Design Name:   spi_slave
// Module Name:   E:/MyWork/iCE_PRJ/piboard/spi_rev0/spi_rev0/spi_slave_tb.v
// Project Name:  spi_rev0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: spi_slave
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module spi_slave_tb;

	// Inputs
	reg i_clk;
	reg i_rst;
	reg i_cs;
	reg i_sclk;
	reg i_mosi;
	reg [15:0] data_in;

	// Outputs
	wire o_miso;
	wire rec_done;
	wire transmit_done;
	wire [4:0] channel_num;
	wire [1:0] transmit_cnt;
	

	// Instantiate the Unit Under Test (UUT)
	spi_slave uut (
		.i_clk(i_clk), 
		.i_rst(i_rst), 
		.i_cs(i_cs), 
		.i_sclk(i_sclk), 
		.i_mosi(i_mosi), 
		.o_miso(o_miso), 
		.rec_done(rec_done), 
		.transmit_done(transmit_done), 
		.data_in(data_in), 
		.rec_data(rec_data)
	
	);
	
		

	parameter clk_period = 1000/48.0;
	
	initial begin
		i_clk = 0;
		forever #(clk_period/2) i_clk = ~i_clk;		
	end
	
	integer i;
	
	initial begin
	
		i = 0;
		i_rst = 0;
		i_cs = 1;
		i_sclk = 0;
		i_mosi = 1;
		
		#500;
		i_rst = 1;
		#1000;
		i_rst = 0;
		
		
		#1000;
		i_cs = 0;
		#200;		
		i_mosi = 1;//1	
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 1;//2
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);
		
		i_mosi = 1;//3	
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 1;//4
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//5
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//6
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//7
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//8
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//9
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//10
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//11
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//12
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//13
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//14
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//15
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 1;//16
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		
		
		repeat (300) @(posedge i_clk);
		
		for(i=0;i<64;i=i+1)
		begin
			
			if(i==0 || i==16 || i== 32 || i==48 ||i==64)
				begin	
				i_cs = 1;//
				repeat (200) @(posedge i_clk);
				i_cs = 0;//
				end
				
			repeat (15) @(posedge i_clk);
			i_sclk = 1;
			repeat (10) @(posedge i_clk);
			i_sclk = 0;
			repeat (20) @(posedge i_clk);
		end
		
		///////////////////////////////////////////
		repeat (1000) @(posedge i_clk);
		i_mosi = 1;//1	
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 1;//2
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);
		
		i_mosi = 1;//3	
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 1;//4
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//5
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//6
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//7
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//8
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//9
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//10
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//11
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//12
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//13
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//14
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 0;//15
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		repeat (15) @(posedge i_clk);		
		i_mosi = 1;//16
		repeat (5) @(posedge i_clk);
		i_sclk = 1;
		repeat (10) @(posedge i_clk);
		i_sclk = 0;
		
		
		
		repeat (300) @(posedge i_clk);
		
		for(i=0;i<64;i=i+1)
		begin
			
			if(i==0 || i==16 || i== 32 || i==48 ||i==64)
				begin	
			//	i_cs = 1;//
				repeat (200) @(posedge i_clk);
				i_cs = 0;//
				end
				
			repeat (15) @(posedge i_clk);
			i_sclk = 1;
			repeat (10) @(posedge i_clk);
			i_sclk = 0;
			repeat (20) @(posedge i_clk);
		end	
		

	end
	
	
	
	
	
	
	
	
	
	always @(posedge i_clk or posedge i_rst) begin
        if(i_rst) begin
            data_in <= 16'h07cb;           
        end else begin            
           	if(rec_done)
				data_in <= data_in+16'ha177;	
        end 
    end
	
	
	
	
      
endmodule

