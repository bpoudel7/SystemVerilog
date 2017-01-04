`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/03/2017 04:30:07 PM
// Design Name: 
// Module Name: BCD2SevenSegDecoder
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

module BCD2SevenSegDecoder( input  wire [3:0] BCDinput,
                            output reg  [6:0] sevenSegOutput
                           );
    
    //for COMMON CATHODE seven segment display
    always_comb
    begin
        case(BCDinput)                 //abcdefg
            4'd0: sevenSegOutput    = 7'b1111110;
            4'd1: sevenSegOutput    = 7'b0110000;
            4'd2: sevenSegOutput    = 7'b1101101;
            4'd3: sevenSegOutput    = 7'b1111001;
            4'd4: sevenSegOutput    = 7'b0110011;
            4'd5: sevenSegOutput    = 7'b1011011;
            4'd6: sevenSegOutput    = 7'b1011111;
            4'd7: sevenSegOutput    = 7'b1110000;
            4'd8: sevenSegOutput    = 7'b1111111;
            4'd9: sevenSegOutput    = 7'b1111011;
            default: sevenSegOutput = 7'b0000000;             
        endcase        
    end
    
    /*
    //for COMMON ANODE seven segment display
    always_comb
    begin
        case(BCDinput)                 //abcdefg
            4'd0: sevenSegOutput    = 7'b0000001;
            4'd1: sevenSegOutput    = 7'b1001111;
            4'd2: sevenSegOutput    = 7'b0010010;
            4'd3: sevenSegOutput    = 7'b0000110;
            4'd4: sevenSegOutput    = 7'b1001100;
            4'd5: sevenSegOutput    = 7'b0100100;
            4'd6: sevenSegOutput    = 7'b0100000;
            4'd7: sevenSegOutput    = 7'b0001111;
            4'd8: sevenSegOutput    = 7'b0000000;
            4'd9: sevenSegOutput    = 7'b0000100;
            default: sevenSegOutput = 7'b1111111;             
        endcase        
    end
    */
                                   
endmodule
