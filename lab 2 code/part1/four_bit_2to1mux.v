module four_bit_2to1mux (sel,a,b,chosen); // Starts a 4-bit mux built from four 1-bit muxes.
 
	input sel; // Takes the select bit used by all four bit positions.
	input[3:0] a, b; // Takes the two 4-bit values that can be chosen.
	output[3:0] chosen; // Sends out the final 4-bit chosen value.
	
    one_bit_2to1mux mux0(.s(sel), .x(a[0]), .y(b[0]), .m(chosen[0])); // Chooses the output bit for position 0.
    one_bit_2to1mux mux1(.s(sel), .x(a[1]), .y(b[1]), .m(chosen[1])); // Chooses the output bit for position 1.
    one_bit_2to1mux mux2(.s(sel), .x(a[2]), .y(b[2]), .m(chosen[2])); // Chooses the output bit for position 2.
    one_bit_2to1mux mux3(.s(sel), .x(a[3]), .y(b[3]), .m(chosen[3])); // Chooses the output bit for position 3.
 
endmodule // Ends the 4-bit mux module.
