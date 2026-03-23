module part6_instantiate(SW,HEX1,HEX2, HEX3, HEX4); // Starts a top-level module that sends switch data to part6.
 
	input[9:0] SW ; // Reads all 10 switches from the board.
	output [6:0] HEX1, HEX2, HEX3, HEX4; // Sends 7-segment patterns to four displays.
	part6 instantiate_p6 (.s(SW[9:8]),.u(SW[7:6]),.v(SW[5:4]),.w(SW[3:2]),.x(SW[1:0]), // Passes the switch groups into the part6 selector inputs.
							.code1(HEX1), // Connects the first display code from part6 to HEX1.
							.code2(HEX2), // Connects the second display code from part6 to HEX2.
							.code3(HEX3), // Connects the third display code from part6 to HEX3.
							.code4(HEX4) // Connects the fourth display code from part6 to HEX4.
							);  // Finishes the part6 module connection.
endmodule // Ends this top-level wiring module.
