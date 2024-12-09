`timescale 1ns / 100ps // Each time step will be 1 ns, and the resolution of the simulation will be in steps of 100 ps

// ALU implementing addition, multiplication, module, and bitwise AND
// 0: add, 1: mult, 2: module, 3: bitwise AND
module ALU(
    input [3:0] a,
    input [3:0] b,
    input [1:0] op,
    output logic [7:0] result);

    always @(*) begin 
        case(op)
            2'b00: result = a + b;
            2'b01: result = a * b;
            2'b10: result = a % b;
            2'b11: result = a & b;
            default: result = 8'b0;
        endcase 
    end

endmodule

module ALU_tb;
    reg [3:0] a;
    reg [3:0] b;
    reg [1:0] op;
    reg [7:0] result;

    ALU DUT(
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    // Monitor the outputs
    initial begin
        $monitor("Time: %0t | a: %d | b: %d | op: %d | result: %d", $time, a, b, op, result);
        $dumpfile("ALU_tb.vcd");
        $dumpvars(0, ALU_tb);
    end

    initial
        begin
            a = 5; b = 3; op = 2'b00; // 8
            #5            op = 2'b01; // 15
            #5            op = 2'b10; // 2
            #5            op  = 2'b11; // 1
            #5 $finish;
        end

endmodule