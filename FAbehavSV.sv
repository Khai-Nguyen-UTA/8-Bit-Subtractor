module FAbehavSV (a, b, cin, s, cout);
	input a, b, cin;
	output logic s, cout;
	always_comb
		{cout,s} = a + b + cin;
endmodule