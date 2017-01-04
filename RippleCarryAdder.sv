`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bikash Poudel 
// 
// Create Date: 01/03/2017 09:52:23 PM
// Design Name: 
// Module Name: RippleCarryAdder
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

module RippleCarryAdder(    input  [3:0] a,
                            input  [3:0] b,
                            output [3:0] s,         
                            output       c3
                       );
                       
    //wires to connect the intermediate carry
    wire [2:0] c;
    
    //instantiating the full adder four times       
    FullAdder FA0 (	.InA(a[0]),
                    .InB(b[0]),
                    .Cin(1'b0),
                    .Sum(s[0]),
                    .CarryOut(c[0])
                  );  
                    
    FullAdder FA1 (	.InA(a[1]),
                    .InB(b[1]),
                    .Cin(c[0]),
                    .Sum(s[1]),
                    .CarryOut(c[1])
                  );
                  
    FullAdder FA2 (	.InA(a[2]),
                    .InB(b[2]),
                    .Cin(c[1]),
                    .Sum(s[2]),
                    .CarryOut(c[2])
                  );

    FullAdder FA3 (	.InA(a[3]),
                    .InB(b[3]),
                    .Cin(c[2]),
                    .Sum(s[3]),
                    .CarryOut(c3)
                  );
                                                                                 
endmodule
