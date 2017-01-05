`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/04/2017 09:02:40 PM
// Design Name: 
// Module Name: RAM8x256
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

module RAM8x256(    addrLine, //port declaration only
                    inDataLine,
                    clock,
                    chipSel,
                    readData,
                    writeData,
                    outDataLine
                );
                
    //parameters for the bus width
    parameter ADDR_WD = 8;
    parameter DATA_WD = 8;   
    parameter DEPTH   = 256;
    
    //ports definition
    input      [ADDR_WD-1:0] addrLine;
    input      [DATA_WD-1:0] inDataLine;
    output reg [DATA_WD-1:0] outDataLine;
    
    input  clock,
           chipSel,
           readData,
           writeData;
    
    reg [DATA_WD-1:0] SRAM [DEPTH-1: 0];
    
    //synchronous SRAM reading and writing
    always_ff @(posedge clock)
    begin
        if(chipSel == 1'b1) begin
            if(readData == 1'b1 && writeData == 1'b0)begin
                outDataLine <= SRAM[addrLine];
            end
            else if(readData == 1'b0 && writeData == 1'b1)begin
                SRAM[addrLine] <= inDataLine;    
            end
            else;
        end        
    end
    
    /* For asynchronous SRAM
    always_ff @(posedge clock, chipSelect, readData, writeData)
    begin
        if(chipSel == 1'b1) begin
        if(readData == 1'b1 && writeData == 1'b0)begin
            outDataLine <= SRAM[addrLine];
        end
        else if(readData == 1'b0 && writeData == 1'b1)begin
            SRAM[addrLine] <= inDataLine;    
        end
        else;
    end        
        
    end                
    */   
                 
endmodule
