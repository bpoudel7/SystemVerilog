`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/02/2017 06:47:43 PM
// Design Name: 
// Module Name: Multiplexer
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


module Multiplexer( input  wire [7:0] InA,
					input  wire [7:0] InB,
					input  wire [7:0] InC,
					input  wire [7:0] InD,
					input  wire [1:0] Sel,
					output reg  [7:0] ValOut
                  );

	always_comb
	begin
		case(Sel)
			2'b00:   ValOut = InA;
			2'b01:   ValOut = InB;
			2'b10:   ValOut = InC;
			2'b11:   ValOut = InD;
			default: ValOut = 8'h0;
		endcase
	end
    
    /*
    always @ (InA, InB, InC, InD, Sel)
	begin
		case(Sel)
			2'b00:   ValOut = InA;
			2'b01:   ValOut = InB;
			2'b10:   ValOut = InC;
			2'b11:   ValOut = InD;
			default: ValOut = 8'h0;
		endcase
	end
    */
    
    /*
    always_comb
	begin
		if(Sel == 2'b00)begin
			ValOut = InA;	
		end
		else if (Sel == 2'b01) begin
			ValOut = InB;
		end
		else if (Sel == 2'b10) begin
			ValOut = InC;
		end
		else begin
			ValOut = 8'h0;
		end		
	end
    */
           
endmodule
