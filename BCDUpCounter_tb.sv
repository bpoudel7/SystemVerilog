`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/04/2017 01:24:44 PM
// Design Name: 
// Module Name: BCDUpCounter_tb
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

module BCDUpCounter_tb;
    
    reg test_clock;
    reg test_reset;
    
    wire [3:0] test_count;
    
    BCDUpCounter bcdCntr( .clock(test_clock),
                          .reset(test_reset),
                          .count(test_count)
                        );
    
    initial 
    begin
        //initialization
        test_clock = 1'b0;
        test_reset = 1'b1;
        #100;
        
        //simulation stimulus
        test_reset = 1'b0;
        
    end
    
    always #10 test_clock = ~test_clock; 
     
endmodule

