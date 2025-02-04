module SubTL8(
	input [7:0] A, B,
	output reg [7:0] solution,
	output Cout
);
	logic Coutwire;
	logic [7:0] outFinal, out;
	//assign Boutreg = BoutSign;
	assign Cout =  Coutwire;


RCAddSub RCAddSub_inst
(
	.AddSub(1'b1) ,	// input  AddSub_sig
	.A(A) ,	// input [7:0] A_sig
	.B(B) ,	// input [7:0] B_sig
	.S(out) ,	// output [7:0] S_sig
	.Cout(Coutwire) 	// output  Cout_sig
);

twoSign twoSignStep3
(
	.A(out) ,	// input [N-1:0] A_sig
	.B(outFinal) 	// output [N-1:0] B_sig
);

assign solution = (Coutwire == 1'b0) ? outFinal : out;
//assign solution = out;
	
endmodule 