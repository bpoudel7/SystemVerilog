`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/03/2017 02:59:28 PM
// Design Name: 
// Module Name: Bin2OneHotDecoder_tb
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

module Bin2OneHotDecoder_tb;
    
    reg  [2:0] test_Bin;
    wire [7:0] test_OneHotCode;
    
    //temporary variables for simulation
    reg [7:0] expOutput; //expected output
    reg [2:0] simInput;
    reg isError; // 1: yes, 0: no
    
    Bin2OneHotDecoder OHde(   .Bin(test_Bin),   
                              .OneHotCode(test_OneHotCode)   
                           );
    
    initial
    begin
        //initialization
        test_Bin = 3'b000;
        simInput = 3'b000;
        #100;
        
        //Simulation Stimulus
        /*
        Repeat is similar to the for loop. Instead of explicitly specifying a variable 
        and incrementing it when we declare the for loop, we tell the program how many 
        times to run through the code, and no variables are incremented.    
        */
        $display("\n| Binary | One-Hot Code | expectedOutput | isError |");
        repeat (8) 
        begin
            test_Bin = simInput;
            
            //calculation of expected output
            //the code is just the copy of the code in source .sv file except the variable names
            case(test_Bin)
                3'b000:  expOutput = 8'b0000_0001;
                3'b001:  expOutput = 8'b0000_0010;
                3'b010:  expOutput = 8'b0000_0100;
                3'b011:  expOutput = 8'b0000_1000;
                3'b100:  expOutput = 8'b0001_0000;
                3'b101:  expOutput = 8'b0010_0000;
                3'b110:  expOutput = 8'b0100_0000;
                3'b111:  expOutput = 8'b1000_0000;
                default: expOutput = 8'bxxxx_xxxx;
                                                   
            endcase 
            #10; //10 ns wait 
            if(test_OneHotCode != expOutput) begin
                isError = 1'b1;    
            end
            else begin
                isError = 1'b0;
            end
            
            $display("\n| %6b | %12b | %14b | %7b |", test_Bin, test_OneHotCode, expOutput, isError);
            
            simInput = simInput + 1'b1;       
        end //end of repeat
        
    end //end of initial
     
endmodule
