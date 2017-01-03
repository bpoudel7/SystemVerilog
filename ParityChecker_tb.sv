`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/02/2017 03:46:57 PM
// Design Name: 
// Module Name: ParityChecker_tb
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


module ParityChecker_tb;
    
    reg [63:0] test_receivedData;
    reg test_recEvenParity;
    reg test_recOddParity;
    wire test_isErrorEven;
    wire test_isErrorOdd;
    
    reg expectedErrorEven, expectedErrorOdd; 
    
    ParityChecker pc(	    .receivedData(test_receivedData), 
    			    .recEvenParity(test_recEvenParity),
    			    .recOddParity(test_recOddParity),
    			    .isErrorEven(test_isErrorEven),
    			    .isErrorOdd(test_isErrorOdd)
        	    );
	initial
	begin
		test_receivedData  = 64'h0; 
		test_recEvenParity = 1'b0;
		test_recOddParity  = 1'b0;
		#100;
		
		test_receivedData  = 64'hFFFF_FFFF_FFFF_FFFF; 
		test_recEvenParity = 1'b0;
		test_recOddParity  = 1'b1;
		
		expectedErrorEven  = (^test_receivedData)  ^ test_recEvenParity;
		expectedErrorOdd   = ~((^test_receivedData)^ test_recOddParity);
		#10;
		$display("test_isErrorEven = %x and expected output = %x\n", test_isErrorEven, expectedErrorEven);	
		$display("test_isErrorOdd  = %x and expected output = %x\n", test_isErrorOdd, expectedErrorOdd);
		
		test_receivedData  = 64'hFFFF_FFFF_FFFF_FFFF; 
		test_recEvenParity = 1'b1;
		test_recOddParity  = 1'b0;
		
		expectedErrorEven  = (^test_receivedData)   ^ test_recEvenParity;
		expectedErrorOdd   = ~((^test_receivedData) ^ test_recOddParity);
		#10;
		$display("\ntest_isErrorEven = %x and expected output = %x\n", test_isErrorEven, expectedErrorEven);	
		$display("test_isErrorOdd  = %x and expected output = %x\n", test_isErrorOdd, expectedErrorOdd);
		
	end
	 				
endmodule
