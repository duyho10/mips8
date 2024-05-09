module logic(Logic_result, A,B,Select);
output reg [7:0] Logic_result;
input [7:0] A,B;
input [1:0] Select;
wire [7:0] And_Result,Or_Result,Nor_Result,Xor_Result;


And_8bit Logic_And(And_Result,A,B);
Or_8bit Logic_Or(Or_Result,A,B);
Nor_8bit Logic_Nor(Nor_Result,A,B);
Xor_8bit Logic_Xor(Xor_Result,A,B);

always@(*)
begin
case (Select[1:0])
2'b00: Logic_result = And_Result;
2'b01: Logic_result = Or_Result;
2'b10: Logic_result = Xor_Result;
2'b11: Logic_result = Nor_Result;
endcase
end
endmodule
