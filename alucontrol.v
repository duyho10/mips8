module alu_control(ALU_Funct,Opcode, funct_in);
output reg [2:0]ALU_Funct;
input [2:0]Opcode;
input [2:0]funct_in;
localparam R_TYPE = 3'd0;
localparam ADDI = 3'b001;
localparam BEQ = 3'b100;
localparam LB = 3'b010;
localparam SB = 3'b011;
always @(*)
begin
ALU_Funct = 3'b000;
if(Opcode == R_TYPE)
begin
ALU_Funct = funct_in;
end
else
begin
case(Opcode)
ADDI:
begin
ALU_Funct = 3'b000 ; // ADD
end
BEQ:
begin
ALU_Funct = 3'b010 ; // SUB
end
LB:
begin
ALU_Funct = 3'b000 ; // ADD
end
SB:
begin
ALU_Funct = 3'b000 ; // ADD
end
default:
begin
ALU_Funct = 3'b001;
end
endcase
end
end
endmodule 