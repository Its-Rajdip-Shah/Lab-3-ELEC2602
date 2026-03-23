`timescale 1ns / 1ps // Sets the simulation time unit to 1 ns and the time precision to 1 ps.
 
module part2_TB; // Starts a testbench for the 1-bit 4-to-1 mux.
 
	// This line starts a short note block about the testbench setup.
	// This line says the mux under test is created below.
	// This line says the testbench drives the inputs and checks the output.
 
	reg [3:0] count; // Holds a counter that steps through the test patterns.
	reg [1:0] select; // Stores the 2-bit select value for the mux.
	reg  input1, input2, input3, input4; // Stores the four input bits used in each test.
	wire output1; // Carries the mux output so the testbench can observe it.
	
	one_bit_4to1mux instantiate_mux4(.s(select),.u(input1),.v(input2),.w(input3),.x(input4),.m(output1)); // Creates the mux being tested and connects the test signals.
 	
	initial begin  // Starts the setup block that runs once at time 0.
	    $dumpfile("part2.vcd");
        $dumpvars(0, part2_TB);

		count = 4'b0000; // Starts the test counter at zero.

        #1000;
        $finish;
	end // Ends the one-time setup block.
	
	always begin // Starts a repeating block that advances the test counter.
		#50 // Waits 50 ns before moving to the next test case.
		count=count+4'b0001; // Increases the counter to trigger the next input pattern.
	end // Ends the repeating counter block.
	
	always @(count) begin // Updates the input values whenever the counter changes.
		case (count) // Chooses the test pattern for the current count value.
		4'b0000 : begin input1 = 1'b1; input2 = 1'b0; input3 = 1'b0; input4 = 1'b0; select = 2'b00; end // Checks that select 00 picks the first input.
		4'b0001 : begin input1 = 1'b1; input2 = 1'b0; input3 = 1'b0; input4 = 1'b0; select = 2'b01; end // Checks that select 01 moves away from the first input.
		4'b0010 : begin input1 = 1'b1; input2 = 1'b0; input3 = 1'b0; input4 = 1'b0; select = 2'b10; end // Checks that select 10 does not pick the first input.
		4'b0011 : begin input1 = 1'b1; input2 = 1'b0; input3 = 1'b0; input4 = 1'b0; select = 2'b11; end // Checks that select 11 does not pick the first input.
		4'b0100 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b0; select = 2'b00; end // Checks that select 00 does not pick the second input.
		4'b0101 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b0; select = 2'b01; end // Checks that select 01 picks the second input.
		4'b0110 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b0; select = 2'b10; end // Checks that select 10 does not pick the second input.
		4'b0111 : begin input1 = 1'b0; input2 = 1'b1; input3 = 1'b0; input4 = 1'b0; select = 2'b11; end // Checks that select 11 does not pick the second input.
		default : begin input1 = 1'b0; input2 = 1'b0; input3 = 1'b0; input4 = 1'b0; select = 2'b00; end // Gives safe values after the listed cases.
	endcase // Ends the list of test patterns.
	end // Ends the block that applies test inputs.

 
endmodule // Ends the part 2 testbench.
