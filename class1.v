
module add1bit(a,b,ci,sum,co);
input a;
input b;
input ci;

output sum;
output co;

wire a;
wire b;
wire ci;
wire sum;
wire co;

assign sum= a^b^ci;
assign co=(a&b)|(a&ci)|(b&ci);

endmodule

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



endmodule
