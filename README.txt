The octal to binary decoder functionally converts a octal symbols 
(or numbers) into binary representation. Since there are eight
octal numbers, we need 3-bit to represent the octal number system.

In truth table, ranging from O0 to O7 there are eight octal numbers
as the input. The binary number is represented by B2B1B0 which is 
the output. For eg., when O0 is input then B2B1B0 = 000 and when 
O1 is input then B2B1B0 = 111.  


Truth Table:
--------------------------------------------------------
|              Inputs                   ||    Outputs   |
--------------------------------------------------------
| O7 | O6 | O5 | O4 | O3 | O2 | O1 | O0 || B2 | B1 | B0 |
--------------------------------------------------------
| 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  || 0  | 0  | 0  |
| 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  || 0  | 0  | 1  |
| 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  || 0  | 1  | 0  |
| 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  || 0  | 1  | 1  |
| 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  || 1  | 0  | 0  |
| 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  || 1  | 0  | 1  |
| 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  || 1  | 1  | 0  |
| 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  || 1  | 1  | 1  |
---------------------------------------------------------


#SIMULATION LOG from VIVADO ISIM simulator
Built simulation snapshot Oct2BinEncoder_tb_behav
Vivado Simulator 2015.4
Time resolution is 1 ps

| O7 | O6 | O5 | O4 | O3 | O2 | O1 | O0 || B2 | B1 | B0 |

|  0 |  0 |  0 |  0 |  0 |  0 |  0 |  1 ||  0 |  0 |  0 |

|  0 |  0 |  0 |  0 |  0 |  0 |  1 |  0 ||  0 |  0 |  1 |

|  0 |  0 |  0 |  0 |  0 |  1 |  0 |  0 ||  0 |  1 |  0 |

|  0 |  0 |  0 |  0 |  1 |  0 |  0 |  0 ||  0 |  1 |  1 |

|  0 |  0 |  0 |  1 |  0 |  0 |  0 |  0 ||  1 |  0 |  0 |

|  0 |  0 |  1 |  0 |  0 |  0 |  0 |  0 ||  1 |  0 |  1 |

|  0 |  1 |  0 |  0 |  0 |  0 |  0 |  0 ||  1 |  1 |  0 |

|  1 |  0 |  0 |  0 |  0 |  0 |  0 |  0 ||  1 |  1 |  1 |
