There are two types of parity codes viz., even parity and odd parity. Parity code is used for transmission error checking
in serial communication. At the sender end, parity of a message or data is generated and appended at the end of the message.
And, at the receiver side parity checking is done to check the integrity of the received message. 

Say A[2:0] is message and eP is even parity and oP is odd parity. Then eP and oP are generated as, 

A[2] | A[1] | A[0] | eP | oP|
0    | 0    |  0   | 0  | 1 |
0    | 0    |  1   | 1  | 0 |
0    | 1    |  0   | 1  | 0 |
0    | 1    |  1   | 0  | 1 |
1    | 0    |  0   | 1  | 0 |
1    | 0    |  1   | 0  | 1 |
1    | 1    |  0   | 0  | 1 |
1    | 1    |  1   | 1  | 0 |
     
so, eP is A[2] ^ A[1] ^ A[0]
and, oP is ~(A[2] ^ A[1] ^ A[0])

We have xor reductin operator to generate the even and odd parity.



#SIMULATION LOG
# run 1000ns
Output from ParityGenerator: EvenParity = 0 (expected value = 0)
Output from ParityGenerator: OddParity = 1 (expected value = 1)
Output from ParityGenerator: EvenParity = 1 (expected value = 1)
Output from ParityGenerator: OddParity = 0 (expected value = 0)
Output from ParityGenerator: EvenParity = 0 (expected value = 0)
Output from ParityGenerator: OddParity = 1 (expected value = 1)
