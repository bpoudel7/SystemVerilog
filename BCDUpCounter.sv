`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/04/2017 12:52:15 PM
// Design Name: 
// Module Name: BCDUpCounter
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

module BCDUpCounter(    input clock,
                        input reset,
                        output reg [3:0] count
                    );

    always_ff @ (posedge clock)
    begin
        if(reset == 1'b1) begin
            count <= 4'd0; 
        end
        
        if(count < 4'd9) begin
            count <= count + 1'b1;        
        end
        else if (count == 4'd9) begin
            count <= 4'd0;
        end
    end
                        
endmodule
