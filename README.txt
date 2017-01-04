DFF is a basic unit of memory. It operates on the clock. At
every positive (or negative) edge of the clock, the output
Q is assigned the value of the input D.

Truth table for positive edge triggered D FF:

--------------------------
| D | clock   | Q | Qbar |
--------------------------
| 0 | posedge | 0 |  1   |
| 1 | negedge | 0 |  1   |
| 1 | posedge | 1 |  0   |
| 0 | negedge | 1 |  0   |
| 0 | posedge | 0 |  1   |
-------------------------- 

 
