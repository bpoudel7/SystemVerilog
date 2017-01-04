The seven segment display has seven LEDs which are represented by alphabets 
from a to g. For common cathode seven segment display, if 1 is send to the 
LED then it will glow. However, for common anode seven segment display, 0 
makes the LED glow.


Mapping of seven segment LEDs connection into our system verilog module output,
                g   f   e   d   c   b   a
sevenSegOutput [0] [1] [2] [3] [4] [5] [6] 


Truth table for Common Cathode Seven segment decoder:
---------------------------
| Input  ||    Output     |
---------------------------
| BCD    || a b c d e f g |
---------------------------
|   0    || 1 1 1 1 1 1 0 |
|   1    || 0 1 1 0 0 0 0 |
|   2    || 1 1 0 1 1 0 1 |
|   3    || 1 1 1 1 0 0 1 |  0 = off
|   4    || 0 1 1 0 0 1 1 |
|   5    || 1 0 1 1 0 1 1 |  1 = on
|   6    || 1 0 1 1 1 1 1 |
|   7    || 1 1 1 0 0 0 0 |
|   8    || 1 1 1 1 1 1 1 |
|   9    || 1 1 1 1 0 1 1 |
--------------------------   

===================================================================

Truth table for Common Anode Seven segment decoder:
---------------------------
| Input  ||    Output     |
---------------------------
| BCD    || a b c d e f g |
---------------------------
|   0    || 0 0 0 0 0 0 1 |
|   1    || 1 0 0 1 1 1 1 |
|   2    || 0 0 1 0 0 1 0 |
|   3    || 0 0 0 0 1 1 0 |  1 = off
|   4    || 1 0 0 1 1 0 0 |
|   5    || 0 1 0 0 1 0 0 |  0 = on
|   6    || 0 1 0 0 0 0 0 |
|   7    || 0 0 0 1 1 1 1 |
|   8    || 0 0 0 0 0 0 0 |
|   9    || 0 0 0 0 1 0 0 |
---------------------------   


#SIMULATION LOG
# run 1000ns

| Input ||   Seven Segment Output    || isError |

|  BCD  || a | b | c | d | e | f | g ||         |

|     0 || 1 | 1 | 1 | 1 | 1 | 1 | 0 ||       0 |

|     1 || 0 | 1 | 1 | 0 | 0 | 0 | 0 ||       0 |

|     2 || 1 | 1 | 0 | 1 | 1 | 0 | 1 ||       0 |

|     3 || 1 | 1 | 1 | 1 | 0 | 0 | 1 ||       0 |

|     4 || 0 | 1 | 1 | 0 | 0 | 1 | 1 ||       0 |

|     5 || 1 | 0 | 1 | 1 | 0 | 1 | 1 ||       0 |

|     6 || 1 | 0 | 1 | 1 | 1 | 1 | 1 ||       0 |

|     7 || 1 | 1 | 1 | 0 | 0 | 0 | 0 ||       0 |

|     8 || 1 | 1 | 1 | 1 | 1 | 1 | 1 ||       0 |

|     9 || 1 | 1 | 1 | 1 | 0 | 1 | 1 ||       0 |




