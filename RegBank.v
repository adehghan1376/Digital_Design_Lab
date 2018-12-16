module RegBank(a,b,c,dataC,write,clk,dataA,dataB);

	input [0:5]a;
	input [0:5]b;
	input [0:5]c;
	
	input [0:64]dataC;
	input write;
	input clk;
	output [0:64]dataA;
	output [0:64]dataB;
	
	reg[0:64] mem [0:32];	//the memory
	
	///// read A \\\\\\\
	/*integer inta
	always @( a )
   		inta = a;*/
	assign dataA=mem[a];
	///// ###### \\\\\\\

	///// read B \\\\\\\
	/*integer intb
	always @( b )
   		intb = b;*/
	assign dataB=mem[b];
	///// ###### \\\\\\\

	///// write C \\\\\\\
	/*integer intc
	always @( c )
   		intc = c;*/

	always @(posedge clk)
	begin
	      if(write == 1'b1)
	        mem[c] = dataC;
	end
	///// ####### \\\\\\\
endmodule

