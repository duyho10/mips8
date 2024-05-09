module And_8bit(And_8,A,B);
output [7:0] And_8;
input [7:0] A, B;
And_1bit And0(And_8[0], A[0], B[0]);
And_1bit And1(And_8[1], A[1], B[1]);
And_1bit And2(And_8[2], A[2], B[2]);
And_1bit And3(And_8[3], A[3], B[3]);
And_1bit And4(And_8[4], A[4], B[4]);
And_1bit And5(And_8[5], A[5], B[5]);
And_1bit And6(And_8[6], A[6], B[6]);
And_1bit And7(And_8[7], A[7], B[7]);
endmodule

