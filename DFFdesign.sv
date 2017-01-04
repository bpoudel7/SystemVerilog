`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/04/2017 12:07:50 PM
// Design Name: 
// Module Name: DFFdesign
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

module DFFdesign( input      D,
                  input      clock,
                  output reg Q,
                  output reg Qbar
                );
    
    always_ff @ (posedge clock)
    begin
        Q    <= D;
        Qbar <= ~D;
    end
                    
endmodule
