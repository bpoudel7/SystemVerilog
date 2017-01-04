A better way to code a complex combinational logic is to use FUNCTIONS 
to code the combinational circuit logic. The primary advantage of having
function is that functions can not have state, which eliminates possible
automatic introduction of registers in a combinational circuit by HDL
compilers such as Xilinx ISE, Vivado, etc. 

In addition, functions force a result. Meaning, compiler will fail if 
a function does not generate desired result. If you build a function wrong,
the circuit will not synthesize. But, if you use an always block to build 
a combinational circuit, then the output variable should be a registers type 
variable. A combinational circuit with a register type output is not a pure 
combinational circuit, but, it is a sequential circuit.

----------------------------------------------------------------------------  
|                           Input                         ||    Output     |
----------------------------------------------------------------------------  
| doorLocked | seatBeltOn | isDriverDrowsy | isIgnitionOn || warningBuzzer |    
----------------------------------------------------------------------------  
|     0      |      0     |       0        |       0      ||       0       |           
|     0      |      0     |       0        |       1      ||       0       |         
|     0      |      0     |       1        |       0      ||       0       |                
|     0      |      0     |       1        |       1      ||       1       |                
|     0      |      1     |       0        |       0      ||       0       |               
|     0      |      1     |       0        |       1      ||       1       |       
|     0      |      1     |       1        |       0      ||       0       |   
|     0      |      1     |       1        |       1      ||       1       |  
|     1      |      0     |       0        |       0      ||       0       |         
|     1      |      0     |       0        |       1      ||       1       |  
|     1      |      0     |       1        |       0      ||       0       |  
|     1      |      0     |       1        |       1      ||       1       |  
|     1      |      1     |       0        |       0      ||       0       |  
|     1      |      1     |       0        |       1      ||       1       |  
|     1      |      1     |       1        |       0      ||       0       |  
|     1      |      1     |       1        |       1      ||       1       |   
----------------------------------------------------------------------------     

Boolean Equation for above truth table,

warningBuzzer = (isIgnitionOn & isDriverDrowsy) | (isIgnitionOn & seatBeltOn) | (isIgnitionOn & doorLocked);    

============================================================================================================================
========================================= Car Warning System Version 1 using boolean equation ==============================
============================================================================================================================
    module CarWarningSystemV1(      input  doorLocked,       // 0: No, 1: yes 
                                    input  seatBeltOn,      // 0: No, 1: yes
                                    input  isDriverDrowsy, // 0: No, 1: yes
                                    input  isIgnitionOn,  // 0: No, 1: yes
                                    output warningBuzzer //the output type is "wire"
                            );
        
        assign warningBuzzer = (isIgnitionOn & isDriverDrowsy) | (isIgnitionOn & seatBeltOn) | (isIgnitionOn & doorLocked);                         
                            
    endmodule
****************************************************************************************************************************


============================================================================================================================
========================================= Car Warning System Version 2 using always_comb ===================================
============================================================================================================================
    module CarWarningSystemV2(  input  doorLocked,       // 0: No, 1: yes 
                            input  seatBeltOn,          // 0: No, 1: yes
                            input  isDriverDrowsy,     // 0: No, 1: yes
                            input  isIgnitionOn,      // 0: No, 1: yes
                            output reg warningBuzzer //the output type is "reg" OR it won't synthesize
                        );        //So, if you need temporary variables inside always_comb that need to be "register" 
                                 //The resulting comb ckts end up having multiple registers or memory = NOT PERFECT COMB CKT 
    always_comb
    begin
        warningBuzzer = 1'b0;
        if(isIgnitionOn == 1) begin
            if((doorLocked == 1) || (seatBeltOn == 1) || (isDriverDrowsy == 1)) begin
                warningBuzzer = 1'b1;    
            end
        end
    end                         
                        
endmodule    

****************************************************************************************************************************

============================================================================================================================
========================================= Car Warning System Version 3 using FUNCTION (A better way) =======================
============================================================================================================================

    module CarWarningSystemV3(  input  doorLocked,       // 0: No, 1: yes 
                                input  seatBeltOn,      // 0: No, 1: yes
                                input  isDriverDrowsy, // 0: No, 1: yes
                                input  isIgnitionOn,  // 0: No, 1: yes
                                output warningBuzzer //the output type is "wire"
                       ); //IMPORTANT NOTE: the core logic is same as that of V2 but the output is of type "wire" not "reg"
        
        assign warningBuzzer = myCarWarning(doorLocked, seatBeltOn, isDriverDrowsy, isIgnitionOn);  
        
        function myCarWarning;
            input doorLocked, seatBeltOn, isDriverDrowsy, isIgnitionOn;
            begin
                myCarWarning = 1'b0;
                if(isIgnitionOn == 1) begin
                    if((doorLocked == 1) || (seatBeltOn == 1) || (isDriverDrowsy == 1)) begin
                        myCarWarning = 1'b1;    
                    end
                end
            end                         
        endfunction                
    endmodule

****************************************************************************************************************************

