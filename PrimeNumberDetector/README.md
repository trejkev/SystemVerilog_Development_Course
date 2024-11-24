The Prime Number Detector is a circuit that takes three bits as an input, they three combined form a number through their concatenation as CBA. The intention with the circuit is to provide the ability to detect prime numbers, so that it would detect that 2, 3, 5, or 7 are prime numbers, by setting its output P to 1, and will be zero for all the other cases.

The circuit that makes it possible is the following.

<p align="center">
  <img src="https://github.com/user-attachments/assets/9846ae37-b385-4fc5-b164-ed0fcac2c7cf" width="900" />
</p>

It was possible to confirm its functionality by utilizing the testbench, the output from the monitor is shown below.

    Time: 0   | input: 0 | P: 0
    Time: 50  | input: 1 | P: 0
    Time: 100 | input: 2 | P: 1
    Time: 150 | input: 3 | P: 1
    Time: 200 | input: 4 | P: 0
    Time: 250 | input: 5 | P: 1
    Time: 300 | input: 6 | P: 0
    Time: 350 | input: 7 | P: 1
