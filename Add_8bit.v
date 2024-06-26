module Add_8bit(Sum,Cout,A,B,Cin);
output [7:0]Sum;
output Cout;
input [7:0]A,B;
input Cin;
wire [7:0]C_out;
Add_1bit bit0(Sum[0] ,C_out[0] ,A[0] ,B[0] ,Cin);
Add_1bit bit1(Sum[1] ,C_out[1] ,A[1] ,B[1] ,C_out[0]);
Add_1bit bit2(Sum[2] ,C_out[2] ,A[2] ,B[2] ,C_out[1]);
Add_1bit bit3(Sum[3],C_out[3] ,A[3],B[3],C_out[2]);
Add_1bit bit4(Sum[4],C_out[4] ,A[4],B[4],C_out[3]);
Add_1bit bit5(Sum[5],C_out[5] ,A[5],B[5],C_out[4]);
Add_1bit bit6(Sum[6],C_out[6] ,A[6],B[6],C_out[5]);
Add_1bit bit7(Sum[7],Cout ,A[7],B[7],C_out[6]);


//Overflow = Cout[3] xor Cout[30]
//Xor OverFlow(Overflow,Cout,C_out[30]);
endmodule
