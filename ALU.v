module ALU(op1,op2,ALU_Control,out,zero);
	input [64:0] op1;
	input [64:0] op2;
	input [3:0] ALU_Control;
	output [64:0] out;
	output zero;
	reg data;
	always @(ALU_Control)
	begin
		#100
		if (ALU_Control==4'b0010)
			data = op1+op2;
		if (ALU_Control==2'b0111)
			data=op2;
		if (ALU_Control==2'b0110)
			data=op1-op2;
		if (ALU_Control==2'b0000)
			data=op1 & op2;
		if (ALU_Control==2'b0001)
			data=op1 | op2;
	end
	assign out=data;


endmodule
