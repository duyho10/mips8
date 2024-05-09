module alu(ALU_result,Zero,Cout,A,B,Funct); //,branch_check
output reg [7:0] ALU_result;
output           Zero, Cout; //,branch_check
input      [7:0] A,B;
input      [2:0] Funct;
wire       [7:0] Add_Sub_result,Logic_result;
wire             C_out;
reg        [7:0] SLT_result;
wire             zero;
AddSub Add_Sub(Add_Sub_result,C_out,A,B,Funct[1]);
logic Logic_r(Logic_result,A,B,Funct[1:0]);

always@(*)
begin
if (A < B)begin 
SLT_result = 8'd1;
end else begin
SLT_result = 0;
end

if ((Funct[2] == 0)&&(Funct[0] == 0)) begin
ALU_result = Add_Sub_result;
end else if (Funct[2] == 1) begin
ALU_result = Logic_result;
end else if ((Funct[2] == 0)&&(Funct[0] == 1)) begin
ALU_result = SLT_result;
end else begin
ALU_result = 0; // fixed 25/7
end
end
assign Zero = (ALU_result == 8'b00000000) ? 1'b1 : 1'b0; 
assign Cout = C_out;
endmodule
