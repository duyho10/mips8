//module PC_adder(A,B,C);
module PC_adder(A,B,C);

input [7:0] A,B;
output [7:0] C;

assign C = A + B;
endmodule
