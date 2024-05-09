module slt_1bit(c,a,b,select);
input a,b,select;
output c;
wire a1,a2;
and (a1,~a,b);
and(c,a1,select);
endmodule
