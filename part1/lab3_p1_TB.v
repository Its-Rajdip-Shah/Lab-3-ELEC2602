`timescale 1ns / 1ps
 
module lab3_p1_TB;
 
	reg [3:0] count;
	reg [1:0] input_c;
	wire [6:0] output_7seg;

	decoder_7seg instantiate_decoder(
		.code(input_c),
		.decoded_output(output_7seg)
	);
 	
	initial begin 
		$dumpfile("sim/lab3_p1.vcd");
		$dumpvars(0, lab3_p1_TB);

		count = 4'b0000;
		#250;
		$finish;
	end
	
	always begin
		#50
		count = count + 4'b0001;
	end
	
	always @(*) begin
		case (count)
			4'b0000 : input_c = 2'b00;
			4'b0001 : input_c = 2'b01;
			4'b0010 : input_c = 2'b10;
			default : input_c = 2'b11;
		endcase
	end

endmodule
