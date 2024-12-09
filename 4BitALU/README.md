The code listed here implements a simple 4-bit aritmetic logic unit. It only considers four operations: addition, multiplication, module, and bitwise AND.

A simple test bench with four different cases was created, in order to collect information about its basic functionality, the output after monitoring the output is the following.

    Time: 0   | a:  5 | b:  3 | op: 0 | result:   8
    Time: 50  | a:  5 | b:  3 | op: 1 | result:  15
    Time: 100 | a:  5 | b:  3 | op: 2 | result:   2
    Time: 150 | a:  5 | b:  3 | op: 3 | result:   1

The next action performed was visualizing the signals with GTK Wave, with the following result, giving enough evidence that the circuit is logically functional.

<p align="center">
  <img src="https://github.com/user-attachments/assets/28f645e5-e42a-4b58-944b-7a195a40cfca" width="900" />
</p>
