`timescale 1 ps / 100 fs 
module AddSub(Add_Sub_result,Cout,A,B,Select);
output [7:0]Add_Sub_result;
output Cout;
input [7:0] A, B;
input Select;
wire [7:0] temp;
wire Coutt;
//wire [7:0] tempslct;
//onebitto8bit slc(tempslct, Select); 
Xor_8bit   Slct(temp,B,{8{Select}});
Add_8bit   Add_Sub(Add_Sub_result,Coutt,A,temp,Select);
assign Cout = (Select == 1)? ~Coutt : Coutt;
endmodule

