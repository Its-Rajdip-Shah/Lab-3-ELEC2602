`timescale 1ns / 1ps
 
module lab3_P2_TB;
 
	reg [3:0] count;
	reg [1:0] S,U,V,W,X;
	
	wire [6:0] output_7seg;

	lab3_P2 instantiate_p5 (
		.s(S),
		.u(U),
		.v(V),
		.w(W),
		.x(X),
		.chosen_7segCode(output_7seg)
	);
 	
	initial begin 
		$dumpfile("sim/lab3_p2.vcd");
		$dumpvars(0, lab3_P2_TB);

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
			default : begin S = 2'b00; U = 2'b11; V = 2'b10; W = 2'b01; X = 2'b00; end
		endcase
	end

endmodule
