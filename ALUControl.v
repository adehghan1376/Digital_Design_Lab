module ALUcontrol(ALUOp,instruction,out);//DONE
	input [1:0]ALUOp;
	input [31:0]instruction; 	//Opcode_field:instruction[31:21]
	output reg [3:0]out;
	wire[12:0] x = {ALUOp, instruction[31:21]};
always@(*)

	begin
	casex (x)
	13'b00XXXXXXXXXXX:
	out = 4'b0010;
	13'bX1XXXXXXXXXXX:
	out = 4'b0111;
	13'b1X10001011000:
	out = 4'b0010;
	13'b1X11001011000:
	out = 4'b0110;
	13'b1X10001010000:
	out = 4'b0000;
	13'b1X10101010000:
	out = 4'b0001;
	default: 
	out = 4'b1111;
endcase


end



	
	// assign out =((ALUOp==2'b00) ? 4'b0010 : out);
	// assign out =((ALUOp[0]==1'b1) ? 4'b0111 : out);
	// assign out =(((ALUOp[1]==1'b1) && (instruction[31:21]==11'b10001011000)) ? 4'b0010 : out);
	// assign out =(((ALUOp[1]==1'b1) && (instruction[31:21]==11'b11001011000)) ? 4'b0110 : out);
	// assign out =(((ALUOp[1]==1'b1) && (instruction[31:21]==11'b10001010000)) ?  4'b0000 : out);
	// assign out =(((ALUOp[1]==1'b1) && (instruction[31:21]==11'b10101010000)) ?  4'b0001 : out);
	
	
	

	
endmodule
