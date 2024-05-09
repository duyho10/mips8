module Mux2to1_8bit(
    input [7:0] I0,
    input [7:0] I1,
    input s0, 
    output reg [7:0] out 
    );
always @ (I0 or I1 or s0)
case (s0)
    0: out = I0;
    1: out = I1;
endcase
endmodule
