module mult(in1,in2,selector,out); //DONE
		parameter n=64;
  input [n-1:0] in1;
  input [n-1:0] in2;
  input selector;
  output [n-1:0] out;
  assign out = ( selector ? in2 : in1 );
endmodule
