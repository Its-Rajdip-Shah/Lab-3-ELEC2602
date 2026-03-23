module one_bit_4to1muxV2 (s, u, v, w, x, m); // Starts a 1-bit 4-to-1 mux module written with always blocks.

    input [1:0] s; // Takes the 2-bit select value that picks one of four inputs.
    input u, v, w, x; // Takes the four 1-bit input choices.
    output reg m; // Stores the chosen output bit.

    reg t1, t2; // Holds the two middle results before the final choice.

    always @(u, v, s[0]) begin // Updates the first middle result when u, v, or the low select bit changes.
        if (s[0] == 1'b1) // Checks if the low select bit asks for the second input in this pair.
            t1 = v; // Chooses v for the first pair when s[0] is 1.
        else // Handles the case where the low select bit is 0.
            t1 = u; // Chooses u for the first pair when s[0] is 0.
    end // Ends the first pair selection block.

    always @(w, x, s[0]) begin // Updates the second middle result when w, x, or the low select bit changes.
        if (s[0] == 1'b1) // Checks if the low select bit asks for the second input in this pair.
            t2 = x; // Chooses x for the second pair when s[0] is 1.
        else // Handles the case where the low select bit is 0.
            t2 = w; // Chooses w for the second pair when s[0] is 0.
    end // Ends the second pair selection block.

    always @(t1, t2, s[1]) begin // Updates the final output when the middle results or high select bit change.
        if (s[1] == 1'b1) // Checks if the high select bit asks for the second middle result.
            m = t2; // Sends the second middle result to the output.
        else // Handles the case where the high select bit is 0.
            m = t1; // Sends the first middle result to the output.
    end // Ends the final selection block.

endmodule // Ends the 1-bit 4-to-1 mux module.
