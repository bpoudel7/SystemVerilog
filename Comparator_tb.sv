`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/02/2017 06:22:16 PM
// Design Name: 
// Module Name: Comparator_tb
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

module Comparator_tb;
    
    reg [3:0] test_A;
    reg [3:0] test_B;
    
    wire test_gt, test_lt, test_eq;
    
    reg expGt, expLt, expEq;
    
    Comparator cmp( .A(test_A),
    		    .B(test_B),
    		    .gt(test_gt),
    		    .lt(test_lt),
    		    .eq(test_eq)
                   );
	initial
	begin
		//initialization
		test_A = 4'h0;	
		test_B = 4'h0;
		#100;
		
		//simulation inputs
		//first input stimulation
		$display("\n|  A |  B | gt | exp_gt | lt | exp_lt | eq | exp_eq |");
		test_A = 4'hF;	
		test_B = 4'hA;
		
		//calculation of expected output
		if(test_A > test_B) begin
			expGt = 1'b1;
			expLt = 1'b0;
			expEq = 1'b0;
		end
		else if(test_A < test_B) begin
			expGt = 1'b0;
			expLt = 1'b1;
			expEq = 1'b0;
		end
		else begin
			expGt = 1'b0;
			expLt = 1'b0;
			expEq = 1'b1;
		end 
		
		#10;
		$display("\n| %d | %d | %2d | %6d | %2d | %6d | %2d | %6d |", test_A, test_B, test_gt, expGt, test_lt, expLt, test_eq, expEq);
		
		//second input stimulation
		test_A = 4'hA;	
		test_B = 4'hF;
		
		//calculation of expected output
		if(test_A > test_B) begin
			expGt = 1'b1;
			expLt = 1'b0;
			expEq = 1'b0;
		end
		else if(test_A < test_B) begin
			expGt = 1'b0;
			expLt = 1'b1;
			expEq = 1'b0;
		end
		else begin
			expGt = 1'b0;
			expLt = 1'b0;
			expEq = 1'b1;
		end 
		
		#10;
		$display("\n| %d | %d | %2d | %6d | %2d | %6d | %2d | %6d |", test_A, test_B, test_gt, expGt, test_lt, expLt, test_eq, expEq);
		
		//third input stimulation
		test_A = 4'h5;	
		test_B = 4'h5;
		
		//calculation of expected output
		if(test_A > test_B) begin
			expGt = 1'b1;
			expLt = 1'b0;
			expEq = 1'b0;
		end
		else if(test_A < test_B) begin
			expGt = 1'b0;
			expLt = 1'b1;
			expEq = 1'b0;
		end
		else begin
			expGt = 1'b0;
			expLt = 1'b0;
			expEq = 1'b1;
		end 
		
		#10;
		$display("\n| %d | %d | %2d | %6d | %2d | %6d | %2d | %6d |", test_A, test_B, test_gt, expGt, test_lt, expLt, test_eq, expEq);				
	end
	
endmodule
