module mux (input wire a, b, s, output wire o);
    wire ns;
    wire sa;
    wire nsb;

    assign ns  = !s;
    assign sa  = a & s;
    assign nsb = b & ns;
    assign o   = sa | nsb;

endmodule