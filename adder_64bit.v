module adder_64bit(num1,num2,out);
	input [64:0]num1;
	input [64:0]num2;

	output [64:0]out;

	assign out=num1+num2;

endmodule
