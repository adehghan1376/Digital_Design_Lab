module CPU();
wire clk;
wire pc_write;
wire pc_wEnable;
reg pc_reset;
wire [63:0]pc_out;
wire [31:0] instruction_mem_out;

//Controller wires START

// wire Reg2Loc;
// wire RegWrite;
// wire ALUSrc;
// wire ALUOp;
// wire PCSrc;
// wire MemWrite;
// wire MemRead;
// wire MemtoReg;
initial
begin
pc_reset = 1'b1;
#70
pc_reset = 1'b0;
end
wire Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch;
wire [1:0]ALUOp;
//Controler wires END
//module control(opcode,Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp);


control controller(instruction_mem_out[31:21],Reg2Loc,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp);


OS osilator(clk);

PC_Class PC(clk,pc_write,1'b1,pc_reset,pc_out);

adder_64bit PC_Adder(64'd4,pc_out,pc_adder_out);

InsMem_Class Instruction_Memory(pc_out,instruction_mem_out);

//mult(in1,in2,selector,out)
wire [4:0]ReadRegister2;

mult Mult_RegBank(instruction_mem_out[20:16],instruction_mem_out[4:0],Reg2Loc,ReadRegister2); defparam Mult_RegBank.n=5;


//module RegBank(a,b,c,dataC,write,clk,dataA,dataB);
wire [63:0] ReadData1;
wire [63:0] ReadData2;
wire [63:0] WriteData;
RegBank Register_Bank(instruction_mem_out[9:5] , ReadRegister2 , instruction_mem_out[4:0] , WriteData , RegWrite , clk ,ReadData1,ReadData2);

//module Sign_Extend(instruction,extended_address);
wire [63:0] Sign_Extende_out;
Sign_Extend Sign_Extender(instruction_mem_out,Sign_Extende_out);

//mult(in1,in2,selector,out)
wire [63:0] ALU_Input2;
mult Mult_ALU(ReadData2,Sign_Extende_out,ALUSrc,ALU_Input2); defparam Mult_ALU.n=64;


//module ALUcontrol(ALUOp,instruction,out)
wire [3:0] ALU_Controller_out;
ALUcontrol ALU_Controller (ALUOp,instruction_mem_out[31:21],ALU_Controller_out);


//module ALU_Class(op1,op2,ALU_Control,out,zero);
wire [63:0] ALU_Result;
wire ZERO;
ALU_Class ALU (ReadData1,ALU_Input2,ALU_Controller_out,ALU_Result,ZERO);


//module DataMem_Class(Address,WriteData,MemWrite,MemRead,ReadData,clk);
wire [63:0]ReadData;
DataMem_Class DataMemory (ALU_Result,ReadData2,MemWrite,MemRead,ReadData,clk);


//mult(in1,in2,selector,out)
mult Mult_DataMemory(ReadData,ALU_Result,MemtoReg,WriteData); defparam Mult_DataMemory.n=64;


/////////Shift left 2   START
//Sign_Extende_out -> {2'B00,Sign_Extende_out}[63:0]
wire [63:0] Sign_Extende_out_shifted;
assign Sign_Extende_out_shifted={Sign_Extende_out[63:2],2'B00};
/////////Shift left 2   END

//module adder_nbit(num1,num2,out); parameter n=64;
wire [63:0] ShiftAdderResult;
adder_nbit Shift_Adder (pc_out,Sign_Extende_out_shifted,ShiftAdderResult); defparam Shift_Adder.n=64;

//mult(in1,in2,selector,out)

mult Mult_Branch(pc_adder_out,ShiftAdderResult,(zero & Branch),pc_write); defparam Mult_DataMemory.n=64;








endmodule
