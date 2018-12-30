
module add3bit(a,b,c,ci,sum,co);
input a;
input b;
input c;
input ci;

output sum;
output co;

wire a;
wire b;
wire c;
wire ci;
wire sum;
wire co;

assign{co,sum}=a+b+c+ci;

endmodule


