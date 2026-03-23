`timescale 1ns / 1ps // Sets the simulation time unit to 1 ns and the time precision to 1 ps.

module part1_TB; // Starts a testbench for the 4-bit 2-to-1 mux.

    reg [3:0] count; // Holds a counter that moves through the test cases.
    reg select; // Stores the select bit sent to the mux.
    reg [3:0] input1, input2; // Stores the two 4-bit input values used in each test.
    wire [3:0] output1; // Carries the mux output so the testbench can observe it.

    four_bit_2to1mux instantiate_mux4( // Creates the 4-bit mux being tested.
        .sel(select), // Connects the testbench select bit to the mux select input.
        .a(input1), // Connects the first test input bus to the mux.
        .b(input2), // Connects the second test input bus to the mux.
        .chosen(output1) // Connects the mux output to the observed test wire.
    ); // Finishes the mux connection.

    initial begin // Starts the one-time setup block for the simulation.
        $dumpfile("part1.vcd"); // Tells the simulator to save waveform data in part1.vcd.
        $dumpvars(0, part1_TB); // Tells the simulator which signals to include in the waveform file.

        count = 4'b0000; // Starts the test counter at zero.

        #500; // Lets the simulation run long enough to cover the planned test cases.
        $finish; // Stops the simulation after the test time is over.
    end // Ends the one-time setup block.

    always begin // Starts a repeating block that advances the test counter.
        #50; // Waits 50 ns between test cases.
        count = count + 4'b0001; // Moves to the next test case.
    end // Ends the repeating counter block.

    always @(count) begin // Updates the input values whenever the counter changes.
        case (count) // Chooses the test pattern for the current count value.
            4'b0000: begin input1 = 4'b0000; input2 = 4'b0001; select = 1'b0; end // Checks that input1 is chosen when select is 0.
            4'b0001: begin input1 = 4'b0010; input2 = 4'b0011; select = 1'b1; end // Checks that input2 is chosen when select is 1.
            4'b0010: begin input1 = 4'b0100; input2 = 4'b0111; select = 1'b0; end // Checks another case with input1 selected.
            4'b0011: begin input1 = 4'b1000; input2 = 4'b1111; select = 1'b1; end // Checks another case with input2 selected.
            default: begin input1 = 4'b0000; input2 = 4'b0000; select = 1'b0; end // Gives safe values after the listed cases.
        endcase // Ends the list of test patterns.
    end // Ends the block that applies test inputs.

endmodule // Ends the part 1 testbench.
