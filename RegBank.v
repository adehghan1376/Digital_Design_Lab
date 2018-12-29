module RegBank(a,b,c,dataC,write,clk,dataA,dataB);    //DONE

	input [0:4]a;
	input [0:4]b;
	input [0:4]c;
	
	input [0:63]dataC;
	input write;
	input clk;
	output [0:63]dataA;
	output [0:63]dataB;
	
	reg[0:63] mem [0:31];	//the memory
	
	///// read A \\\\\\\
	
	assign dataA=mem[a];
	///// ###### \\\\\\\

	///// read B \\\\\\\
	
	assign dataB=mem[b];
	///// ###### \\\\\\\

	///// write C \\\\\\\


	always @(posedge clk)
	begin
	      if(write == 1'b1)
	        mem[c] = dataC;
	end
	///// ####### \\\\\\\
	
	
	
		integer k;

	initial 
	begin
	for (k = 0; k< 32;k = k + 1)
		mem[k] = 0;
	end
endmodule

