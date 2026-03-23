module part2_instantiate(SW, LEDR); // Starts a top-level module that wires switches into part 2.

    input [9:0] SW; // Reads the 10 board switches.
    output [9:0] LEDR; // Drives the 10 red LEDs on the board.

    one_bit_4to1mux instantiate_p2 ( // Creates the 4-to-1 mux used in part 2.
        .s(SW[5:4]), // Uses switches 5 and 4 as the 2-bit select value.
        .u(SW[3]), // Uses switch 3 as the first input bit.
        .v(SW[2]), // Uses switch 2 as the second input bit.
        .w(SW[1]), // Uses switch 1 as the third input bit.
        .x(SW[0]), // Uses switch 0 as the fourth input bit.
        .m(LEDR[0]) // Shows the chosen output bit on LED 0.
    ); // Finishes the part 2 module connection.

endmodule // Ends this top-level wiring module.
