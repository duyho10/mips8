module Add_1bit(Sum,Cout,A,B,Cin);
output Sum;
output Cout;
input A,B;
input Cin;
wire temp1,temp2,temp3;
Xor_1bit xor_0 (temp1,A,B);
And_1bit and_0 (temp2,A,B);
And_1bit and_1 (temp3,temp1,Cin);
Xor_1bit Sum_Result (Sum,temp1,Cin);
Or_1bit Cout_Result (Cout,temp2,temp3);
endmodule

