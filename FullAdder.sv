`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel
// 
// Create Date: 01/02/2017 04:37:25 PM
// Design Name: 
// Module Name: FullAdder
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

module FullAdder(	input  wire InA,
			input  wire InB,
			input  wire Cin,
			output wire Sum,
			output wire CarryOut
    			);
	
	assign Sum = InA ^ InB ^ Cin;
	assign CarryOut = (InA & InB) | (InB & Cin) | (Cin & InA); 
		    			
endmodule
