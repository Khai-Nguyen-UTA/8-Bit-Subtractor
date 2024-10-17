module RCAddSub (
	input AddSub, 				//select add (AddSub=0) or subtract (AddSub=1) operation
	input [7:0] A, B, 		//declare input ports
	output [7:0] S, 			//declare output ports for sum
	output Cout
	); 
	
	//declare carry-out port
	logic [8:0] C; 				//declare internal carries
	assign C[0] = AddSub; 	//Add 0 for addition, 1 for subtraction
	assign Cout = C[8]; 		//rename carry out port
	
	//instantiate the full adder module for each stage of the ripple carry adder
	FAbehavSV s0 (A[0], AddSub^B[0], C[0], S[0], C[1]); //stage 0
	FAbehavSV s1 (A[1], AddSub^B[1], C[1], S[1], C[2]); //stage 1
	FAbehavSV s2 (A[2], AddSub^B[2], C[2], S[2], C[3]); //stage 2
	FAbehavSV s3 (A[3], AddSub^B[3], C[3], S[3], C[4]); //stage 3
	FAbehavSV s4 (A[4], AddSub^B[4], C[4], S[4], C[5]); //stage 0
	FAbehavSV s5 (A[5], AddSub^B[5], C[5], S[5], C[6]); //stage 1
	FAbehavSV s6 (A[6], AddSub^B[6], C[6], S[6], C[7]); //stage 2
	FAbehavSV s7 (A[7], AddSub^B[7], C[7], S[7], C[8]); //stage 3


endmodule