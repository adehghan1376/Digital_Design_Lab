module InsMem_Class(address,out);
	
	reg [64:0]mem[0:32];	//the memory
	input address;
	output [64:0]out;
	//reg [64:0]data;
	assign out=mem[address];

endmodule