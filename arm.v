module arm();
	wire clk;
	OS os1(clk);
wire [0:5]a;
wire [0:5]b;
wire [0:5]c;
//wire write;
wire [0:64]dataA;
wire [0:64]dataB;
wire [0:64]dataC;

//wire reset;
wire [0:64]counter;

	//RegBank(a,b,c,dataC,write,clk,dataA,dataB);
	RegBank rb(a,b,c,dataC,1'b1,clk,dataA,dataB);
	//test_bench(clk,reset,counter);
	test_bench tb(clk,1'b0,counter);
	assign c=counter;
	assign a=c;
reg [0:5]cnow;
reg [0:5]cbefore;
always
begin
	cnow=c;
	#100
	cbefore=cnow;
end
/*
reg resetreg;
assign reset=resetreg;

always
begin
	resetreg=0;
	#3200
	resetreg=1;
	#100
	resetreg=0;
end*/

	assign b=cbefore;
	assign dataC=counter;

endmodule
