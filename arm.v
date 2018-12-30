module arm();
	wire clk;
	OS os1(clk);
wire [0:4]a;
wire [0:4]b;
wire [0:4]c;
//wire write;
wire [0:63]dataA;
wire [0:63]dataB;
wire [0:63]dataC;

//wire reset;
wire [0:63]counter;

	//RegBank(a,b,c,dataC,write,clk,dataA,dataB);
	RegBank rb(a,b,c,dataC,1'b1,clk,dataA,dataB);
	//test_bench(clk,reset,counter);
	test_bench tb(clk,1'b0,counter);
	assign c=counter;
	assign a=c;
reg [0:4]cnow;
reg [0:4]cbefore;
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
