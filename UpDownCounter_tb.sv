`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2017 07:41:59 PM
// Design Name: 
// Module Name: UpDownCounter_tb
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


module UpDownCounter_tb;
    
    reg test_clock;
    reg test_reset;
    reg test_upDown;
    
    wire [3:0] test_count;
    
    UpDownCounter udCntr(   .clock(test_clock),
                            .reset(test_reset),
                            .upDown(test_upDown),          //1: Up and 0: Down
                            .count(test_count)
                        );
    
    initial 
    begin
        //initialization
        test_clock  = 1'b0;
        test_reset  = 1'b1;
        test_upDown = 1'b1;
        #20;
      
        //simulation stimulus
        test_upDown = 1'b1;
        test_reset  = 1'b0;
        #300; // 15*20
        test_upDown = 1'b0;
        test_reset  = 1'b1;
        #20;
        test_reset  = 1'b0;
             
    end
    
    always #10 test_clock = ~test_clock; 
        
endmodule
