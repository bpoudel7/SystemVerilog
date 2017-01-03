`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  Bikash Poudel
// 
// Create Date: 01/02/2017 04:50:06 PM
// Design Name: 
// Module Name: FullAdder_tb
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


module FullAdder_tb;
    
    reg test_InA;
    reg test_InB;
    reg test_Cin;

    wire test_Sum;
    wire test_CarryOut;
	    
    reg [2:0] test_var;
    int i;
    reg expectedSum, expectedCarry;
    
    FullAdder FA(	.InA(test_InA),
    			.InB(test_InB),
    			.Cin(test_Cin),
    			.Sum(test_Sum),
    			.CarryOut(test_CarryOut)
        	     );
	
	initial
	begin
		test_InA = 1'b0;
		test_InB = 1'b0;
		test_Cin = 1'b0;
		
		test_var = 3'b000;
		#100;
		
		$display("\n| InA | InB | Cin | Sum | ExpSum | Carry | ExpCarry|");
		
		for(i = 0; i < 8; i = i+1)
		begin
			test_InA = test_var[2];
			test_InB = test_var[1];
			test_Cin = test_var[0];
			
			expectedSum   = test_InA ^ test_InB ^ test_Cin; 
			expectedCarry = (test_InA & test_InB) | (test_InB & test_Cin) | (test_Cin & test_InA);
			
			test_var = test_var + 1'b1;
			
			#10;
			
			$display("\n| %3d | %3d | %3d | %3d | %6d | %5d | %8d |", test_InA, test_InB, test_Cin, test_Sum, expectedSum, test_CarryOut, expectedCarry); 
		end
		
	end    
     			
endmodule
