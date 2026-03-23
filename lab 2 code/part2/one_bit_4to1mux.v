module one_bit_4to1mux (s, u, v, w, x, m); // Starts a 1-bit 4-to-1 mux built from three 2-to-1 muxes.

    input [1:0] s; // Takes the 2-bit select value that picks one of four inputs.
    input u, v, w, x; // Takes the four 1-bit input choices.
    output m; // Sends out the chosen bit.

    wire t1, t2; // Holds the two middle results before the final choice.

    one_bit_2to1mux mux1(.s(s[0]), .x(u), .y(v), .m(t1)); // Uses the low select bit to choose between u and v.
    one_bit_2to1mux mux2(.s(s[0]), .x(w), .y(x), .m(t2)); // Uses the low select bit to choose between w and x.
    one_bit_2to1mux mux3(.s(s[1]), .x(t1), .y(t2), .m(m)); // Uses the high select bit to choose the final output.

endmodule // Ends the 1-bit 4-to-1 mux module.
