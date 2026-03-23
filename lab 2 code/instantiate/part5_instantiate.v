module part5_instantiate(SW,HEX0); // Starts a top-level module that feeds switch values into part5.

	input[9:0] SW; // Reads all 10 switches from the board.
	output [6:0] HEX0; // Drives one 7-segment display with the chosen code.
	part5 instantiate_p5 (.s(SW[9:8]),.u(SW[7:6]),.v(SW[5:4]),.w(SW[3:2]),.x(SW[1:0]) // Sends grouped switch bits into the part5 module inputs.
							,.chosen_7segCode(HEX0)); // Connects the selected 7-segment output from part5 to HEX0.
	
endmodule // Ends this top-level wiring module.
