module Sign_Extend(instruction,extended_address);   //DONE
	input [31:0] instruction;
	output [63:0] extended_address;
	assign extended_address = ((instruction[31:21]==11'b11111000000)||(instruction[31:21]==11'b11111000100)) ? {{55{instruction[20]}},instruction[20:12]} : (instruction[31:24]==8'b10110101 ?  {{45{instruction[23]}},instruction[23:5]}:0);
endmodule
 //expr ? stmt : stmt
 //expr ? ( expr ? stmt : stmt) : stmt