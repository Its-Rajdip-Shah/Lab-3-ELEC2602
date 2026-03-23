module four_bit_2to1muxV2 (sel, a, b, chosen); // Starts a 4-bit 2-to-1 mux module written with an always block.

    input sel; // Takes the select bit that decides which input bus to use.
    input [3:0] a, b; // Takes the two 4-bit input choices.
    output reg [3:0] chosen; // Stores the 4-bit output chosen by the select bit.

    always @(a, b, sel) begin // Re-checks the output whenever an input or the select bit changes.
        if (sel == 1'b1) // Checks if the select bit is asking for input b.
            chosen = b; // Sends input b to the output.
        else // Handles the case where the select bit is not 1.
            chosen = a; // Sends input a to the output.
    end // Ends the selection logic block.

endmodule // Ends the 4-bit mux module.
