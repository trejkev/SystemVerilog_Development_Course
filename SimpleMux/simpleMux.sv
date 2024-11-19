module mux (input wire a, b, s, output wire o);
    wire ns;
    wire sa;
    wire nsb;

    assign ns  = !s;
    assign sa  = a & s;
    assign nsb = b & ns;
    assign o   = sa | nsb;

endmodule

module mux_tb;
    reg a, b, s, o;

    mux dut(
        .a(a),
        .b(b),
        .s(s),
        .o(o)
    );

    // Monitor the outputs
    initial begin
        $monitor("Time: %0t | a: %d | b: %d | s: %d | o: %d", $time, a, b, s, o);
        $dumpfile("mux_tb.vcd");
        $dumpvars(0, mux_tb);
    end

    // s = 0 selects b, s = 1 selects a
    initial begin
           a = 0; b = 0; s = 0; // o = 0
        #5 a = 0; b = 0; s = 1; // o = 0
        #5 a = 0; b = 1; s = 0; // o = 1
        #5 a = 0; b = 1; s = 1; // o = 0
        #5 a = 1; b = 0; s = 0; // o = 0
        #5 a = 1; b = 0; s = 1; // o = 1
        #5 a = 1; b = 1; s = 0; // o = 1
        #5 a = 1; b = 1; s = 1; // o = 1
    end

endmodule