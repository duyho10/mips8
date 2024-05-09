module Nor_8bit(Nor_8,A, B);
output [7:0] Nor_8;
input [7:0] A, B;
Nor_1bit Nor0(Nor_8[0], A[0], B[0]);
Nor_1bit Nor1(Nor_8[1], A[1], B[1]);
Nor_1bit Nor2(Nor_8[2], A[2], B[2]);
Nor_1bit Nor3(Nor_8[3], A[3], B[3]);
Nor_1bit Nor4(Nor_8[4], A[4], B[4]);
Nor_1bit Nor5(Nor_8[5], A[5], B[5]);
Nor_1bit Nor6(Nor_8[6], A[6], B[6]);
Nor_1bit Nor7(Nor_8[7], A[7], B[7]);
endmodule
