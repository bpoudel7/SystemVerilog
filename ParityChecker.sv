`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel
// 
// Create Date: 01/02/2017 03:25:13 PM
// Design Name: 
// Module Name: ParityChecker
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

module ParityChecker(	input  wire [63:0] receivedData, 
						input  wire recEvenParity,
						input  wire recOddParity,
						output reg isErrorEven,
						output reg isErrorOdd
    				);
	reg temp;
	
	always_comb
	begin
	
		temp <= ^receivedData;
		
		isErrorEven <= temp ^ recEvenParity;  
		isErrorOdd  <= ~(temp ^ recOddParity);
		
	end
			
endmodule