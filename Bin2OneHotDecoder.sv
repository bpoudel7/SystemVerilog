`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/03/2017 02:44:34 PM
// Design Name: 
// Module Name: Bin2OneHotDecoder
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

module Bin2OneHotDecoder(   input wire [2:0] Bin,   
                            output reg [7:0] OneHotCode   
                         );
    
    always_comb
    begin
        case(Bin)
            3'b000:  OneHotCode = 8'b0000_0001;
            3'b001:  OneHotCode = 8'b0000_0010;
            3'b010:  OneHotCode = 8'b0000_0100;
            3'b011:  OneHotCode = 8'b0000_1000;
            3'b100:  OneHotCode = 8'b0001_0000;
            3'b101:  OneHotCode = 8'b0010_0000;
            3'b110:  OneHotCode = 8'b0100_0000;
            3'b111:  OneHotCode = 8'b1000_0000;
            default: OneHotCode = 8'bxxxx_xxxx; //x is dont care logic
                                               // a reg type data can have '1', '0', 'x', 'z' states
        endcase
    end
                             
endmodule
