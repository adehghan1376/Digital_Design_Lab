module test_bench(clk,reset,counter);

	input clk;
	input reset;
	output [0:64]counter;
	reg [0:64]data;
	initial begin
		data=0;
	end
	always @(posedge clk)
	begin
		if(data == 64'b100000)
			data = 0;
		if(reset)
		 	data = 0;
		else
		 	data = data + 64'b1;
	end 

	
		
	
	assign counter = data;
	

endmodule
