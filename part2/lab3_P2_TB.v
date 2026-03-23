`timescale 1ns / 1ps
 
module lab3_P2_TB;
 
	reg [1:0] S, U, V, W, X;
	wire [6:0] output_7seg;

	lab3_P2 instantiate_p5 (
		.s(S),
		.u(U),
		.v(V),
		.w(W),
		.x(X),
		.chosen_7segCode(output_7seg)
	);
 	
	initial begin 
		$dumpfile("sim/lab3_p2.vcd");
		$dumpvars(0, lab3_P2_TB);

		// -----------------------------
		// Test set 1:
		// U = 00, V = 01, W = 10, X = 11
		// -----------------------------
		U = 2'b00; V = 2'b01; W = 2'b10; X = 2'b11;

		S = 2'b00; #20;   // m = 00, d = 0000111
		S = 2'b01; #20;   // m = 01, d = 1110000
		S = 2'b10; #20;   // m = 10, d = 0011100
		S = 2'b11; #20;   // m = 11, d = 1100011

		// -----------------------------
		// Test set 2:
		// U = 01, V = 10, W = 11, X = 00
		// -----------------------------
		U = 2'b01; V = 2'b10; W = 2'b11; X = 2'b00;

		S = 2'b00; #20;   // m = 01, d = 1110000
		S = 2'b01; #20;   // m = 10, d = 0011100
		S = 2'b10; #20;   // m = 11, d = 1100011
		S = 2'b11; #20;   // m = 00, d = 0000111

		$finish;
	end

endmodule