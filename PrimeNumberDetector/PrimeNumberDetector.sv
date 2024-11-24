`timescale 1ns / 100ps // Each time step will be 1 ns, and the resolution of the simulation will be in steps of 100 ps

module pnd(
    input wire a,
    input wire b,
    input wire c,
    output p
    );

    assign p = (~c && b) || (a && c);

endmodule

module pnd_tb;
    reg A;
    reg B;
    reg C;
    reg P;
    integer input_comb;

    pnd my_pnd(
        .a(A),
        .b(B),
        .c(C),
        .p(P)
    );

    // Monitor the outputs
    initial begin
        // $monitor("Time: %0t | C: %d | B: %d | A: %d | P: %d", $time, C, B, A, P);
        $monitor("Time: %0t | input: %0d | P: %d", $time, input_comb, P);
        $dumpfile("pnd_tb.vcd");
        $dumpvars(0, pnd_tb);
    end

    initial
        begin
               C = 0; B = 0; A = 0;
            #5 C = 0; B = 0; A = 1;
            #5 C = 0; B = 1; A = 0;
            #5 C = 0; B = 1; A = 1;
            #5 C = 1; B = 0; A = 0;
            #5 C = 1; B = 0; A = 1;
            #5 C = 1; B = 1; A = 0;
            #5 C = 1; B = 1; A = 1;
            #5
            $finish;
        end

    // Update input_comb everytime C, B, or A change
    always @(C, B, A) begin
        input_comb = {C, B, A}; // Concatenate C, B, A to form a binary number
    end

endmodule