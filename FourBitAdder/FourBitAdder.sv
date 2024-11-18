`timescale 1ns / 100ps // Each time step will be 1 ns, and the resolution of the simulation will be in steps of 100 ps
module halfAdder(
    input A, 
    input B,
    output Cout, 
    output S
    );

    and(Cout, A, B);
    xor(S, A, B);

endmodule

module fullAdder(
    input A,
    input B,
    input Cin,
    output Cout,
    output S
    );

    wire Cout1, Cout2, S1;

    halfAdder halfAdder1(.A(A), .B(B), .Cout(Cout1), .S(S1));
    halfAdder halfAdder2(.A(S1), .B(Cin), .Cout(Cout2), .S(S));
    or(Cout, Cout1, Cout2);

endmodule

module fourBitAdder (
    input [3:0] A,
    input [3:0] B,
    output [4:0] C
    );

    wire Cout0, Cout1, Cout2, Cout3;

    halfAdder halfAdder0(
        .A(A[0]),
        .B(B[0]),
        .Cout(Cout0),
        .S(C[0])
    );
    fullAdder fullAdder1(
        .A(A[1]),
        .B(B[1]),
        .Cin(Cout0),
        .Cout(Cout1),
        .S(C[1])
    );
    fullAdder fullAdder2(
        .A(A[2]),
        .B(B[2]),
        .Cin(Cout1),
        .Cout(Cout2),
        .S(C[2])
    );
    fullAdder fullAdder3(
        .A(A[3]),
        .B(B[3]),
        .Cin(Cout2),
        .Cout(Cout3),
        .S(C[3])
    );
    assign C[4] = Cout3;
endmodule

module fourBitAdder_tb;
    reg [3:0] A;
    reg [3:0] B;
    reg [4:0] C;

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
               A = 0; B = 0;             // C = 0
            // TC1: Only one input active
            #5 A = 3; B = 0;             // C = 3
            #5 A = 0; B = 3;             // C = 3
            // TC2: One input at max
            #5 A = 4'b1111; B = 0;       // C = 15
            // TC3: Both inputs with any value
            #5 A = 3; B = 2;             // C = 5
            // TC4: Both inputs at max
            #5 A = 4'b1111; B = 4'b1111; // C = 30
            #5
            $finish;
        end
endmodule