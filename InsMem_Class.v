module InsMem_Class(address,out);   //DONE
	
	reg [31:0]mem[0:63];	//the memory
	input [0:5]address;
	output [31:0]out;
	//reg [63:0]data;
	assign out=mem[address];
	
	//set initial instructions
	initial 
	begin
	mem[0] = 32'h8B1F03E5;
	mem[1] = 32'hF84000A4;
	mem[2] = 32'h8B040086;
	mem[3] = 32'hF80010A6;
	end
	////////
	
endmodule