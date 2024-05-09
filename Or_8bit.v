module Or_8bit(Or_8,A, B);
output [7:0] Or_8;
input [7:0] A, B;
Or_1bit Or0(Or_8[0], A[0], B[0]);
Or_1bit Or1(Or_8[1], A[1], B[1]);
Or_1bit Or2(Or_8[2], A[2], B[2]);
Or_1bit Or3(Or_8[3], A[3], B[3]);
Or_1bit Or4(Or_8[4], A[4], B[4]);
Or_1bit Or5(Or_8[5], A[5], B[5]);
Or_1bit Or6(Or_8[6], A[6], B[6]);
Or_1bit Or7(Or_8[7], A[7], B[7]);
endmodule
