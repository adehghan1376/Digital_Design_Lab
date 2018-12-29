module adder_nbit(num1,num2,out);    //DONE
		parameter n=64;
	input [n-1:0]num1;
	input [n-1:0]num2;

	output [n-1:0]out;

	assign out=num1+num2;

endmodule
