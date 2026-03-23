module two_bit_4to1mux (s, u, v, w, x, m); // Starts a 2-bit 4-to-1 mux built from two 1-bit 4-to-1 muxes.

    input [1:0] s; // Takes the 2-bit select value used for both output bits.
    input [1:0] u, v, w, x; // Takes the four 2-bit input choices.
    output [1:0] m; // Sends out the chosen 2-bit value.

    one_bit_4to1mux mux0(.s(s), .u(u[0]), .v(v[0]), .w(w[0]), .x(x[0]), .m(m[0])); // Chooses bit 0 of the final 2-bit output.
    one_bit_4to1mux mux1(.s(s), .u(u[1]), .v(v[1]), .w(w[1]), .x(x[1]), .m(m[1])); // Chooses bit 1 of the final 2-bit output.

endmodule // Ends the 2-bit 4-to-1 mux module.
