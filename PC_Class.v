module PC_Class(clk,write,wEnable,reset,out);   //DONE
	input clk;
	input [63:0]write;
	input reset;
	input wEnable;
	
	output [63:0]out;
	reg [63:0]data;
	
	always@(posedge clk)
	begin
		if(reset==1'b1)
			data=1'b0;
		else if (wEnable)
			data=write;
	end
	
	assign out=data;
	
	initial
	begin
	#150
	data=64'b0;
	//write=64'b0;
	end
	always@(*)
	begin
		$display("\nPC:\nwrite = %b\nout = %b\n ",write,out);
	end
	
endmodule