`timescale 1ns / 1ps
 
module lab3_P3_TB;
 
	reg [3:0] count;
	reg [1:0] S, U, V, W, X;
	
	wire [6:0] output_7seg1, output_7seg2, output_7seg3, output_7seg4;

	lab3_P3 instantiate_p6 (
		.s(S),
		.u(U),
		.v(V),
		.w(W),
		.x(X),
		.code1(output_7seg1),
		.code2(output_7seg2),
		.code3(output_7seg3),
		.code4(output_7seg4)
	);
 	
	initial begin 
		$dumpfile("sim/lab3_p3.vcd");
		$dumpvars(0, lab3_P3_TB);

		count = 4'b0000;
		#300;
		$finish;
	end
	
	always begin
		#50
		count = count + 4'b0001;
	end
	
	always @(*) begin
		case (count)
			4'b0000 : begin S = 2'b00; U = 2'b00; V = 2'b01; W = 2'b10; X = 2'b11; end
			4'b0001 : begin S = 2'b01; U = 2'b00; V = 2'b01; W = 2'b10; X = 2'b11; end
			4'b0010 : begin S = 2'b10; U = 2'b00; V = 2'b01; W = 2'b10; X = 2'b11; end
			4'b0011 : begin S = 2'b11; U = 2'b00; V = 2'b01; W = 2'b10; X = 2'b11; end
			default : begin S = 2'b00; U = 2'b00; V = 2'b01; W = 2'b10; X = 2'b11; end
		endcase
	end
 
endmodule