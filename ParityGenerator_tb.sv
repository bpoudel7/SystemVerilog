`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2017 01:56:41 PM
// Design Name: 
// Module Name: ParityGenerator_tb
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


module ParityGenerator_tb;
    
    reg [63:0] 	test_dataInput;
    wire 		test_evenParity;
    wire 		test_oddParity;
    
    reg expectedOutput;
    
    ParityGenerator pg(	.dataInput(test_dataInput),
						.evenParity(test_evenParity),
						.oddParity(test_oddParity)
    					);
    
    initial 
    begin
    	test_dataInput = 64'h0;
    	#100;
    	
    	test_dataInput = 64'hFFFF_FFFF;
    	expectedOutput = ^test_dataInput;
    	#10;
    	$display("Output from ParityGenerator: EvenParity = %x (expected value = %x)", test_evenParity, expectedOutput);
    	$display("Output from ParityGenerator: OddParity = %x (expected value = %x)", test_oddParity, ~(expectedOutput));
    	
    	test_dataInput = 64'h0001_FFFF;
    	expectedOutput = ^test_dataInput;
    	#10;
    	$display("Output from ParityGenerator: EvenParity = %x (expected value = %x)", test_evenParity, expectedOutput);
    	$display("Output from ParityGenerator: OddParity = %x (expected value = %x)", test_oddParity, ~(expectedOutput));
    	
    	test_dataInput = 64'hAAAA_0555;
    	expectedOutput = ^test_dataInput;
    	#10;
    	$display("Output from ParityGenerator: EvenParity = %x (expected value = %x)", test_evenParity, expectedOutput);
    	$display("Output from ParityGenerator: OddParity = %x (expected value = %x)", test_oddParity, ~(expectedOutput));
    end
    
    
endmodule
