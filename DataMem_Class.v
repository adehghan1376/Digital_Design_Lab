module DataMem_Class(addressWrite,data2write,write,addressRead,out,clk);
	
	reg [64:0]mem[0:32];	//the memory
	input addressWrite;
	input clk;
	input write;
	input data2write;
	input addressRead;
	output [64:0]out;
	reg [64:0]data;
	assign out=mem[addressRead];

	
	
	always @(posedge clk)
	begin
	      if(write == 1'b1)
	        mem[addressWrite] = data2write;
	end

endmodule