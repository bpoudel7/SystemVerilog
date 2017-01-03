`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2017 06:55:23 PM
// Design Name: 
// Module Name: Multiplexer_tb
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


module Multiplexer_tb;
    
    reg [7:0] test_InA, 
    	      test_InB, 
    	      test_InC, 
    	      test_InD;
	reg [1:0] test_Sel;
	
	wire [7:0] test_ValOut;
	
	reg [7:0] expValOut;    	      
    reg [1:0] sel;
    int i; 
    Multiplexer mux4to1 ( 	.InA(test_InA),
    				.InB(test_InB),
    				.InC(test_InC),
    				.InD(test_InD),
    				.Sel(test_Sel),
    				.ValOut(test_ValOut)
                        );
	initial
	begin
		//initialization
		test_InA = 8'ha;
		test_InB = 8'hb;
		test_InC = 8'hc;
		test_InD = 8'hd;
		test_Sel = 2'b00;
		sel      = 2'b00;
		#100;
		
		//simulation input
		$display("\n| Sel | ValOut | expValOut |");
		for(i = 0; i < 4; i++)
		begin
			test_Sel = sel;
			
			case(test_Sel)
				2'b00:   expValOut = test_InA;
				2'b01:   expValOut = test_InB;
				2'b10:   expValOut = test_InC;
				2'b11:   expValOut = test_InD;
				default: expValOut = 8'h0;
			endcase
			
			#10;
			
			$display("\n| %x |  %x  |  %x  |", test_Sel, test_ValOut, expValOut);
			sel = sel + 1'b1;	
		end
		
	end
	
endmodule
