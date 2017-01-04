`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/03/2017 10:01:16 PM
// Design Name: 
// Module Name: RippleCarryAdder_tb
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


module RippleCarryAdder_tb;
    
    //for supplying input and receiving output from unit under test i.e. RippleCarryAdder
    reg  [3:0] test_a, test_b;
    wire [3:0] test_s;
    wire       test_c3;
    
    //temporary variables
    reg [3:0] expSum;
    reg       expCarry;
    reg       isErrorSum, isErrorCarry;
    
    RippleCarryAdder RCA (   .a(test_a),
                             .b(test_b),
                             .s(test_s),         
                             .c3(test_c3)
                          );
    
    initial
    begin
        //initialization
        test_a = 4'b0000;
        test_b = 4'b0000;
        isErrorSum   = 1'b0; 
        isErrorCarry = 1'b0;
        #100;
        
        //simulation stimulus
        
        repeat (16)
        begin
            repeat (16)
            begin
                //expected value computation
                expCarry = 1'b0;
                {expCarry, expSum} = test_a + test_b;
                #10;
                //check for the error
                if(test_s != expSum) begin
                    $display("\nERROR in sum of %b + %b: Expected sum = %b but sum is %b!!!\n", test_a, test_b, expSum, test_s);
                    isErrorSum = 1;
                end
                
                if(test_c3 != expCarry) begin
                    $display("\nERROR in carry of %b + %b: Expected carry = %b but carry is %b!!!\n", test_a, test_b, expCarry, test_c3);
                    isErrorCarry = 1;
                end
                
                test_b = test_b + 1'b1;
            end //end nested repeat 
            test_a = test_a + 1'b1;
        end//end outer repeat
        
        //error message
        if(isErrorSum == 0) begin
            $display("\nNo Any Error in Sum Computation.\n");               
        end
        
        if(isErrorCarry == 0) begin
            $display("\nNo Any Error in Carry Computation.\n");                    
        end
                            
    end //end initial
                                  
endmodule
