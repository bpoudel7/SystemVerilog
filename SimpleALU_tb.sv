`timescale 1ns / 1ps

//to import the user defined data types defined in definitions.pkg
import definitions::*;

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel
// 
// Create Date: 01/01/2017 01:02:31 PM
// Design Name: 
// Module Name: SimpleALU_tb
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


module SimpleALU_tb;

	instruction_t test_word;
	logic [31:0] alu_out;
	
	//instantiate the module to be tested	
	SimpleALU alu(	.IW(test_word),
				    .result(alu_out)
	             );
	
	//temporary variables
	logic [31:0] expectedOut, count;
	opcodes_t opcode1;
	
	//this initial block runs only once at the beginning 
	initial begin
		//initialization of the inputs
		test_word.a = 16;
		test_word.b = 2;
		opcode1     = opcode1.first; //opcode1 = ADD, first element of enum
		count       = 0;
		//wait for 100 ns for initialization to finish
		#100;
	end
	
	//test code	
	always 
	begin
		//generate new opcode 
		test_word.opcode = opcode1;  
		opcode1 = opcode1.next;	
		
		count++;
		
		//generate the expected output
		case (test_word.opcode)
			ADD:  expectedOut = test_word.a + test_word.b;
			SUB:  expectedOut = test_word.a - test_word.b;
			MUL:  expectedOut = multiplier(test_word.a, test_word.b);
			AND:  expectedOut = test_word.a & test_word.b;
			OR:   expectedOut = test_word.a | test_word.b; 
			XOR:  expectedOut = test_word.a ^ test_word.b;
			SHL:  expectedOut = test_word.a << test_word.b; //shift left
			SHR:  expectedOut = test_word.a >> test_word.b; //shift right
			default: expectedOut = 0;
		endcase
		
		//wait for some time so that output from SimpleALU will be available  	
		#100; //100 ns
		
		//display the observed and expected output
		$display("SimpleALU out = %d (expected output = %d)", alu_out, expectedOut);
		
		//since there are 8 opcodes, we are running simulation for 8 rounds.
		//we need to have this stopping condition else always block runs indefinately
		if(count > 7)
			$finish;
	
	end //always ends
	             
endmodule
