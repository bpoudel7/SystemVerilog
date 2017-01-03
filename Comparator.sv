`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/02/2017 06:10:25 PM
// Design Name: 
// Module Name: Comparator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Comparator( 	input wire [3:0] A,
					input wire [3:0] B,
					output reg gt, //greater than
					output reg lt, //less than
					output reg eq
    			  );
	
	always_comb
	begin
		if(A > B) begin
			gt = 1'b1;
			lt = 1'b0;
			eq = 1'b0;
		end
		else if(A < B) begin
			gt = 1'b0;
			lt = 1'b1;
			eq = 1'b0;
		end
		else begin
			gt = 1'b0;
			lt = 1'b0;
			eq = 1'b1;
		end 	
	end
	
	/* Or you can code as 
	always @(A, B)
		begin
			if(A > B) begin
				gt = 1'b1;
				lt = 1'b0;
				eq = 1'b0;
			end
			else if(A < B) begin
				gt = 1'b0;
				lt = 1'b1;
				eq = 1'b0;
			end
			else begin
				gt = 1'b0;
				lt = 1'b0;
				eq = 1'b1;
			end 	
		end
	*/
	 			
endmodule
