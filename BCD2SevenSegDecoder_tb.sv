`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2017 05:36:46 PM
// Design Name: 
// Module Name: BCD2SevenSegDecoder_tb
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


module BCD2SevenSegDecoder_tb;
    
    reg  [3:0] test_BCDinput;
    wire [6:0] test_sevenSegOutput;
    
    //simulator temporary variables
    reg [6:0] expOutput;
    reg       isError; 
    reg [3:0] simInput;
     
    BCD2SevenSegDecoder sevenSeg( .BCDinput(test_BCDinput),
                                  .sevenSegOutput(test_sevenSegOutput)
                                );
    initial 
    begin
        //initialization
        test_BCDinput = 4'd0;
        simInput = 4'd0;
        #100;
        
        //simulation stimulus
        $display("\n| Input ||   Seven Segment Output    || isError |");
        $display("\n|  BCD  || a | b | c | d | e | f | g ||         |");
        repeat (10) 
        begin
            test_BCDinput = simInput;
            case(test_BCDinput)       //abcdefg
                4'd0: expOutput    = 7'b1111110;
                4'd1: expOutput    = 7'b0110000;
                4'd2: expOutput    = 7'b1101101;
                4'd3: expOutput    = 7'b1111001;
                4'd4: expOutput    = 7'b0110011;
                4'd5: expOutput    = 7'b1011011;
                4'd6: expOutput    = 7'b1011111;
                4'd7: expOutput    = 7'b1110000;
                4'd8: expOutput    = 7'b1111111;
                4'd9: expOutput    = 7'b1111011;
                default: expOutput = 7'b0000000;             
            endcase
            #10;
            if(test_sevenSegOutput != expOutput) begin
                isError = 1'b1;                
            end
            else begin
                isError = 1'b0;
            end
            
            $display("\n| %5d || %b | %b | %b | %b | %b | %b | %b || %7d |", test_BCDinput, test_sevenSegOutput[6], test_sevenSegOutput[5], test_sevenSegOutput[4], test_sevenSegOutput[3], test_sevenSegOutput[2], test_sevenSegOutput[1], test_sevenSegOutput[0], isError);
            
            simInput = simInput + 1'b1;
        end                               
    end
                                       
endmodule
