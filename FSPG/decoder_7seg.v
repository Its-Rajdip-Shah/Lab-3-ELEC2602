module decoder_7seg(code, decoded_output);

	input [1:0] code;
	output reg [6:0] decoded_output;

	always @(*) begin
		case (code)
			2'b00 : decoded_output = 7'b0000111;
			2'b01 : decoded_output = 7'b1110000;
			2'b10 : decoded_output = 7'b0011100;
			2'b11 : decoded_output = 7'b1100011;
			default : decoded_output = 7'b1111111;
		endcase
	end

endmodule
