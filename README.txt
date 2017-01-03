Say A[2:0] is message and recEP is received even parity and recOP is received odd parity. Then parity checking bits isErrorEven and isErrorOdd are generated as, 

    A[2] | A[1] | A[0] | recEP  | recOP | isErrorEven | isErrorOdd|
    0    | 0    |  0   | 0      | 1     | 0           |    0      |      
=>  0    | 0    |  1   | 0 (1)  | 1 (0) | 1           |    1      |  
    0    | 1    |  0   | 1      | 0     | 0           |    0      |  
    0    | 1    |  1   | 0      | 1     | 0           |    0      |  
=>  1    | 0    |  0   | 0 (1)  | 1 (0) | 1           |    1      |  
    1    | 0    |  1   | 0      | 1     | 0           |    0      |  
=>  1    | 1    |  0   | 1 (0)  | 0 (1) | 1           |    1      |  
    1    | 1    |  1   | 1      | 0     | 0           |    0      |
     
so, isErrorEven = A[2] ^ A[1] ^ A[0] ^ eP
and, isErrorOdd = A[2] ^ A[1] ^ A[0] ^ oP 

We have xor reductin operator to generate parity checking bits.

#SIMULATION LOG for our 64-bit received message 64'hFFFF_FFFF_FFFF_FFFF
#whose even parity is 0 and odd parity is 1
# run 1000ns
test_isErrorEven = 0 and expected output = 0

test_isErrorOdd  = 0 and expected output = 0


test_isErrorEven = 1 and expected output = 1

test_isErrorOdd  = 1 and expected output = 1
