
module PC_Class(clk,write,wEnable,reset,out);
	input clk;
	input [64:0]write;
	input reset;
	
	output [64:0]out;
	reg [64:0]data;
	
	always@(posedge clk)
	begin
		if(reset==1)
			data=0;
		else if (wEnable)
			data=write;
	end
	
	assign out=data;
	
	
	
	
endmodule