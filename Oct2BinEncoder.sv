`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel
// 
// Create Date: 01/03/2017 12:13:00 PM
// Design Name: 
// Module Name: Oct2BinEncoder
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

module Oct2BinEncoder(	input  wire O0, O1, O2, O3, O4, O5, O6, O7,
			output reg [2:0] B
    		     );
	
	reg [7:0] octalSymbols;
	
	always_comb
	begin
		//concatenate the inputs to form a 8-bit data 
		octalSymbols = {O7, O6, O5, O4, O3, O2, O1, O0};
		case(octalSymbols)
			8'b00000001: B = 3'b000;
			8'b00000010: B = 3'b001;
			8'b00000100: B = 3'b010;
			8'b00001000: B = 3'b011;
			8'b00010000: B = 3'b100;
			8'b00100000: B = 3'b101;
			8'b01000000: B = 3'b110;
			8'b10000000: B = 3'b111;
			default:     B = 3'bxxx;
		endcase	
	end
	   
	/*
		always @(O0, O1, O2, O3, O4, O5, O6, O7)
		begin
			octalSymbols = {O7, O6, O5, O4, O3, O2, O1, O0};
			case(octalSymbols)
				8'b00000001: B = 3'b000;
				8'b00000010: B = 3'b001;
				8'b00000100: B = 3'b010;
				8'b00001000: B = 3'b011;
				8'b00010000: B = 3'b100;
				8'b00100000: B = 3'b101;
				8'b01000000: B = 3'b110;
				8'b10000000: B = 3'b111;
				default:     B = 3'bxxx;
			endcase	
		end
	*/ 			      
	
endmodule
