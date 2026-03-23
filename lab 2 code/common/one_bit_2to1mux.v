module one_bit_2to1mux (s,x,y,m); // Starts a 1-bit 2-to-1 mux module.
 
	input s, x, y; // Takes the select bit and the two possible input bits.
	output m; // Sends out the chosen bit.
	
	assign m = (~s & x) | (s & y); // Makes the output equal x when s is 0, or y when s is 1.
 
endmodule // Ends the 1-bit mux module.
