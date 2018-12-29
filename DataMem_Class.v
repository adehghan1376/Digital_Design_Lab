module DataMem_Class(Address,WriteData,MemWrite,MemRead,ReadData,clk);   //DONE
	
	reg [63:0]mem[0:31];	//the memory
	input [63:0]Address;
	input clk;
	input MemWrite;
	input WriteData;
	input MemRead;
	output [63:0]ReadData;
	integer k;
	assign ReadData=((MemRead)? mem[Address]: 0 );
initial 
begin
for (k = 0; k< 32;k = k + 1)
mem[k] = 0;
mem[0] = 5;
mem[1] = 5;
mem[2] = 5;
mem[3] = 5;
mem[4] = 5;
	end
	
	always @(posedge clk)
	begin
	      if(MemWrite == 1'b1)
	        mem[Address] = WriteData;
	end

endmodule