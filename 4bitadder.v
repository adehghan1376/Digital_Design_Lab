
module add4bit(a,b,c,d,ci,sum,co);
input a;
input b;
input c;
input d;

input ci;

output sum;
output co;

wire a;
wire b;
wire c;
wire d;
wire ci;
wire sum;
wire co;

assign{co,sum}=a+b+c+d+ci;

endmodule


