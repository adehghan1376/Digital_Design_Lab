module ALU_Class(op1,op2,ALU_Control,out,zero);     //DONE
	input [63:0] op1;
	input [63:0] op2;
	input [3:0] ALU_Control;
	output [64:0] out;


	output zero;
	assign zero = ( out ? 0 : 1);
	
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
			
		
	$display("\nALU:\nOperation = %b\nA = %b\nB = %b\nOutput = %b\nZero = %b\n ",ALU_Control, op1, op2, out, zero);
	
	end
	assign out=data;


endmodule
