`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/04/2017 12:15:18 PM
// Design Name: 
// Module Name: DFFdesign_tb
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

module DFFdesign_tb;
    
    reg test_D;
    reg test_clock;
    
    wire test_Q, test_Qbar;
    
    DFFdesign dff(  .D(test_D),
                    .clock(test_clock),
                    .Q(test_Q),
                    .Qbar(test_Qbar)
                 );
    
    initial
    begin
        //initialization
        test_D      = 1'b0;
        test_clock  = 1'b0;
        #100;    
        
        //simulation stimulus;
        test_D = 1'b1;
        #20;
        test_D = 1'b0;
        #20;
        test_D = 1'b1;
    end
    
    always #10 test_clock = ~test_clock; 
    
endmodule
