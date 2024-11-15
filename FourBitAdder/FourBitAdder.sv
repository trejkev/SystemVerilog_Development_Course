`timescale 1ns / 100ps // Each time step will be 1 ns, and the resolution of the simulation will be in steps of 100 ps
module halfAdder(input wire A, B, output wire Cout, S);
    and(Cout, A, B);
    xor(S, A, B);
endmodule

module fullAdder(input wire A, B, Cin, output wire Cout, S);
    wire Cout1;
    wire Cout2;
    wire S1;
    halfAdder halfAdder1(A, B, Cout1, S1);
    halfAdder halfAdder2(S1, Cin, Cout2, S);
    or(Cout, Cout1, Cout2);
endmodule

module fourBitAdder (input wire [3:0] A,
                     input wire [3:0] B,
                     output wire [4:0] C);
    wire Cout0, Cout1, Cout2, Cout3;
    halfAdder halfAdder0(A[0], B[0], Cout0, C[0]);
    fullAdder fullAdder1(A[1], B[1], Cout0, Cout1, C[1]);
    fullAdder fullAdder2(A[2], B[2], Cout1, Cout2, C[2]);
    fullAdder fullAdder3(A[3], B[3], Cout2, Cout3 , C[3]);
    assign C[4] = Cout3;
endmodule

module fourBitAdder_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] C;

    // Instance of the four bit adder before testing it
    fourBitAdder adder(A, B, C);

    // Monitor the outputs
    initial begin
        $monitor("Time: %0t | A: %d | B: %d | C: %d", $time, A, B, C);
        $dumpfile("fourBitAdder_tb.vcd");
        $dumpvars(0, fourBitAdder_tb);
    end

    // Executes only once at the beginning of the simulation
    initial
        begin
            // TC0: No input active
               A = 0; B = 0; // C = 0
            // TC1: Only one input active
            #5 A = 3; B = 0; // C = 3
            #5 A = 0; B = 3; // C = 3
            // TC2: One input at max
            #5 A = 7; B = 0; // C = 7
            // TC3: Both inputs with any value
            #5 A = 3; B = 2; // C = 5
            // TC4: Both inputs at max
            #5 A = 7; B = 7; // C = 14
            #5
            $finish;
        end
endmodule