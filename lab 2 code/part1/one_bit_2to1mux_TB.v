`timescale 1ns / 1ps // Sets the simulation time unit to 1 ns and the time precision to 1 ps.
 
module one_bit_2to1mux_TB; // Starts a testbench for the 1-bit 2-to-1 mux.
 
	// This line starts a short note block about the testbench setup.
	// This line says the mux under test is created below.
	// This line says the testbench drives the inputs and watches the output.
 
	reg [3:0] count; // Holds a small counter to step through test cases.
	reg select, input1, input2; // Stores the select bit and the two input bits used in the test.
	wire output1; // Carries the mux output so the testbench can observe it.
	one_bit_2to1mux instantiate_mux2(.s(select),.x(input1),.y(input2),.m(output1)); // Creates the mux being tested and connects the test signals.
 	
	initial begin  // Starts the setup block that runs once at time 0.
		count = 4'b0000; // Starts the test counter at zero.
	end // Ends the one-time setup block.
	
	always begin // Starts a repeating block that advances the test counter.
		#50 // Waits 50 ns before moving to the next case.
		count=count+4'b0001; // Increases the counter to trigger the next input pattern.
	end // Ends the repeating counter block.
	
	always @(count) begin // Updates the test inputs whenever the counter changes.
		case (count) // Chooses which input pattern to apply for the current count value.
		4'b0000 : begin input1 = 1'b0; input2 = 1'b1; select = 1'b0; end // Tests that the mux picks input1 when select is 0.
		4'b0001 : begin input1 = 1'b0; input2 = 1'b1; select = 1'b1; end // Tests that the mux picks input2 when select is 1.
		4'b0010 : begin input1 = 1'b1; input2 = 1'b0; select = 1'b0; end  // Tests another case with input1 selected.
		4'b0011 : begin input1 = 1'b1; input2 = 1'b0; select = 1'b1; end // Tests another case with input2 selected.
		default : begin input1 = 1'b0; input2 = 1'b0; select = 1'b0; end // Sets a safe default after the listed cases.
	endcase // Ends the case list of test patterns.
	end // Ends the block that applies the test inputs.

 
endmodule // Ends the mux testbench.
