module part3_instantiate(SW, LEDR); // Starts a top-level module that wires switches into part 3.

    input [9:0] SW; // Reads the 10 board switches.
    output [9:0] LEDR; // Drives the 10 red LEDs on the board.

    two_bit_4to1mux instantiate_p3 ( // Creates the 2-bit 4-to-1 mux used in part 3.
        .s(SW[9:8]), // Uses switches 9 and 8 as the 2-bit select value.
        .u(SW[7:6]), // Uses switches 7 and 6 as the first 2-bit input.
        .v(SW[5:4]), // Uses switches 5 and 4 as the second 2-bit input.
        .w(SW[3:2]), // Uses switches 3 and 2 as the third 2-bit input.
        .x(SW[1:0]), // Uses switches 1 and 0 as the fourth 2-bit input.
        .m(LEDR[1:0]) // Shows the chosen 2-bit result on LEDs 1 and 0.
    ); // Finishes the part 3 module connection.

endmodule // Ends this top-level wiring module.
