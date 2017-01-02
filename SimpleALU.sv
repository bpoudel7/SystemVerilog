`timescale 1ns / 1ps
//to import the user defined data types defined in definitions.pkg
import definitions::*;

//////////////////////////////////////////////////////////////////////////////////
// Company:  
// Engineer:  Bikash Poudel 
// 
// Create Date: 01/01/2017 12:43:48 PM
// Design Name: 
// Module Name: SimpleALU
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
module SimpleALU(	input instruction_t IW,    //instruction input
					output logic [31:0] result 
                );
	
	always_comb 
	begin  //generates a combinational circuit
		case (IW.opcode)
			ADD:  result = IW.a + IW.b;
			SUB:  result = IW.a - IW.b;
			MUL:  result = multiplier(IW.a, IW.b);
			AND:  result = IW.a & IW.b;
			OR:   result = IW.a | IW.b; 
			XOR:  result = IW.a ^ IW.b;
			SHL:  result = IW.a << IW.b; //shift left
			SHR:  result = IW.a >> IW.b; //shift right
			default: result = 0;
		endcase
	end                
endmodule
