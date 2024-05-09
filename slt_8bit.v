module slt_8bit(slt_8,A,B,Select);
output [7:0] slt_8;
input [7:0] A, B;
input Select;
slt_1bit slt0(slt_8[0], A[0], B[0], Select);
slt_1bit slt1(slt_8[1], A[1], B[1], Select);
slt_1bit slt2(slt_8[2], A[2], B[2], Select);
slt_1bit slt3(slt_8[3], A[3], B[3], Select);
slt_1bit slt4(slt_8[4], A[4], B[4], Select);
slt_1bit slt5(slt_8[5], A[5], B[5], Select);
slt_1bit slt6(slt_8[6], A[6], B[6], Select);
slt_1bit slt7(slt_8[7], A[7], B[7], Select);
endmodule
