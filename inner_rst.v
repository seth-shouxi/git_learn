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
//   ==================================================================

`timescale 1 ns / 1 ps
 
module inner_rst(
                   input         	i_clk,
                   output  reg      rst                 
                   );
    
 
	reg	[9:0]	cnt_rst;
 
	// synchronous active high reset 
    always @(posedge i_clk) begin
        if(cnt_rst == 10'd1000) begin
            cnt_rst	<=	cnt_rst;
            rst 	<=	1'b0;
        end else begin
            cnt_rst	<= 	cnt_rst + 1;           
            rst 	<=	1'b1;          
        end 
    end 

 
		
endmodule 