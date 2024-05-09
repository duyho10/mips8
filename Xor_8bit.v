module Xor_8bit(Xor_8,A, B);
output [7:0] Xor_8;
input [7:0] A, B;
Xor_1bit Xor0(Xor_8[0], A[0], B[0]);
Xor_1bit Xor1(Xor_8[1], A[1], B[1]);
Xor_1bit Xor2(Xor_8[2], A[2], B[2]);
Xor_1bit Xor3(Xor_8[3], A[3], B[3]);
Xor_1bit Xor4(Xor_8[4], A[4], B[4]);
Xor_1bit Xor5(Xor_8[5], A[5], B[5]);
Xor_1bit Xor6(Xor_8[6], A[6], B[6]);
Xor_1bit Xor7(Xor_8[7], A[7], B[7]);
endmodule
