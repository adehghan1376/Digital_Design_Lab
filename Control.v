module control(ALUOp,Opcode_field,out);
	input [1:0]ALUOp;
	input [32:0]Opcode_field;
	output [3:0]out;
	reg o;
	always
	begin	
		if(ALUOp == 2'b00)
			o=4'b0010;
		if(ALUOp[0]==1'b1)
			o=4'b0111;
		if(ALUOp[1]==1'b1)
			if(Opcode_field[31:21]==11'b10001011000)
				o=4'b0010;
		if(ALUOp[1]==1'b1)
			if(Opcode_field[31:21]==11'b11001011000)
				o=4'b0110;	
		if(ALUOp[1]==1'b1)
			if(Opcode_field[31:21]==11'b10001010000)
				o=4'b0000;		
		if(ALUOp[1]==1'b1)
			if(Opcode_field[31:21]==11'b10101010000)
				o=4'b0001;	
	end
	
endmodule
