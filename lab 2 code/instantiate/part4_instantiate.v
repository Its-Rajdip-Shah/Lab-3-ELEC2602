module part4_instantiate(SW,HEX0); // Starts a top-level module that connects switches to one 7-segment display.

	input[9:0] SW; // Takes the 10 board switches in as the module input.
	output [6:0] HEX0; // Sends the 7-segment pattern out to display HEX0.
	decoder_7seg instantiate_decoder(.code(SW[1:0]),.decoded_output(HEX0)); // Uses the lowest 2 switches as the code and shows the decoded result on HEX0.
	
endmodule // Ends this top-level wiring module.
