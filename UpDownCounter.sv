`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/04/2017 01:57:21 PM
// Design Name: 
// Module Name: 4-bitUpDownCounter
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


module UpDownCounter(   input clock,
                        input reset,
                        input upDown,          //1: Up and 0: Down
                        output reg [3:0] count
                    );
    reg [3:0] cnt;
    
    //always block to reset the counter
    always @(reset, upDown)
    begin
        
        if(reset == 1'b1) begin
            if(upDown == 1'b1) begin
                cnt <= 4'd0; //for up counter
            end
            else begin
                cnt <= 4'd15; //for down counter
            end
        end               
    end
    
    //counter block
    always_ff @ (posedge clock)
    begin    
        if(upDown == 1'b1) begin
            cnt <= cnt + 1'b1;
        end
        else if(upDown == 1'b0) begin              
            if(cnt > 4'd0) begin
                cnt <= cnt - 1'b1;
            end
            
            if(cnt == 4'd0) begin
                cnt <= 4'd15;
            end                                     
        end
        else;  
    end
    
    assign count = cnt;
                            
endmodule
