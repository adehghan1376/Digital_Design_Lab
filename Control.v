module control(opcode,Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp);
	output reg [1:0]ALUOp;
	input [10:0]opcode;
	output reg Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch;
	always @(opcode)
	begin
	    casex (opcode)
		11'b1XX0101X000 : 
      {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 9'b000100010;

		11'b11111000010 : 
      {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 9'b111110000;

		11'b11111000000 : 
      {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 9'b111001000;

		11'b10110100XXX : 
      {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 9'b101000101;

    default : {Reg2Loc, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 9'b000000000;
		endcase
  end
  // assign ALUOp={ALUOp1, ALUOp0};
endmodule
