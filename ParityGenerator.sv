`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel
// 
// Create Date: 01/02/2017 01:45:37 PM
// Design Name: 
// Module Name: ParityGenerator
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

module ParityGenerator(	input wire [63:0] dataInput,
						output wire evenParity,
						output wire oddParity
    				  );
	assign evenParity = ^dataInput; //using reduction xor operator
	assign oddParity  = ~(^dataInput);
			    					
endmodule
