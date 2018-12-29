module adder_64bit(num1,num2,out);    //DONE
	input [63:0]num1;
	input [63:0]num2;

	output [63:0]out;

	assign out=num1+num2;

endmodule
