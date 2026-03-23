module part1_instantiate(SW, LEDR); // Starts a top-level module that wires switches into part 1.

    input [9:0] SW; // Reads the 10 board switches.
    output [9:0] LEDR; // Drives the 10 red LEDs on the board.

    four_bit_2to1mux instantiate_p1 ( // Creates the 4-bit mux used in part 1.
        .sel(SW[8]), // Uses switch 8 as the select bit.
        .a(SW[7:4]), // Uses switches 7 to 4 as the first 4-bit input.
        .b(SW[3:0]), // Uses switches 3 to 0 as the second 4-bit input.
        .chosen(LEDR[3:0]) // Shows the chosen 4-bit result on LEDs 3 to 0.
    ); // Finishes the part 1 module connection.

endmodule // Ends this top-level wiring module.
