In digital circuits, one-hot refers to a group of bits among which the legal combinations 
of values are only those with a single high (1) bit and all the others low (0). A similar 
implementation in which all bits are '1' except one '0' is sometimes called one-cold.

For a 3-bit binary inputs, there are eight possible one-hot codes as shown in the truth table.
 
Truth Table for bianry to one-hot decoding:
---------------------
| Binary | One-Hot  |
---------------------
| 000    | 00000001 |
| 001    | 00000010 |
| 010    | 00000100 |
| 011    | 00001000 |
| 100    | 00010000 |
| 101    | 00100000 |
| 110    | 01000000 |
| 111    | 10000000 |
---------------------

#SIMULATION LOG
Built simulation snapshot Bin2OneHotDecoder_tb_behav
Vivado Simulator 2015.4
Time resolution is 1 ps

| Binary | One-Hot Code | expectedOutput | isError |

| 000000 | 000000000001 | 00000000000001 | 0000000 |

| 000001 | 000000000010 | 00000000000010 | 0000000 |

| 000010 | 000000000100 | 00000000000100 | 0000000 |

| 000011 | 000000001000 | 00000000001000 | 0000000 |

| 000100 | 000000010000 | 00000000010000 | 0000000 |

| 000101 | 000000100000 | 00000000100000 | 0000000 |

| 000110 | 000001000000 | 00000001000000 | 0000000 |

| 000111 | 000010000000 | 00000010000000 | 0000000 |
 
 
NOTE: There are zeros printed in MSB side beacuse of the $display printing formatting.
