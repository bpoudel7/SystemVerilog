`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2017 02:14:02 PM
// Design Name: 
// Module Name: Oct2BinEncoder_tb
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

module Oct2BinEncoder_tb;
	
	reg  [7:0] test_input;
	wire [2:0] test_output;
    
    int i;
    reg [7:0] test_vector;
    
    Oct2BinEncoder O2Ben(	.O0(test_input[0]), 
    						.O1(test_input[1]), 
    						.O2(test_input[2]), 
    						.O3(test_input[3]), 
    						.O4(test_input[4]), 
    						.O5(test_input[5]), 
    						.O6(test_input[6]), 
    						.O7(test_input[7]),
    						.B(test_output)
        			      );
	
	initial 
	begin
        //initialization
        test_input = 8'b00000000;
        #100;
        
        //simulation stimulus
        test_vector = 8'b00000001;
        
        $display("\n| O7 | O6 | O5 | O4 | O3 | O2 | O1 | O0 || B2 | B1 | B0 |");
        for(i = 0; i < 8; i++)
        begin
            test_input = test_vector << i;
            #10;
            $display("\n| %2d | %2d | %2d | %2d | %2d | %2d | %2d | %2d || %2d | %2d | %2d |", test_input[7], test_input[6], test_input[5], test_input[4], test_input[3], test_input[2], test_input[1], test_input[0], test_output[2], test_output[1], test_output[0]);
                            
        end
	end        			      
	
	        			      
endmodule
