 module instruction_memory(
    input [7:0] pc_input,
    output reg [15:0] instruction_output
);

reg [15:0] memory [0:255];
initial begin

    memory[0] = 16'b0000000001010000;  
    memory[1] = 16'b0000100011010010;   
	 memory[2] = 16'b0000101110010100;   
    memory[3] = 16'b0000110111010101;	 
	 memory[4] = 16'b0000001001010110;
	 memory[5] = 16'b0000110001010111;
	 memory[6] = 16'b0000011001010011; // SLT
	 memory[7] = 16'b0001011010010111; // ADDI R2, R3, 23
	 memory[8] = 16'b0001100101001010; // ADDI R5, R4, 10
	 memory[9] = 16'b0011000001000101; // SB R1,5(R0)
    memory[10] = 16'b0010000111000101; // LW R7,5(R0)	
    memory[11] = 16'b0100001100000011; // BEQ R1,R4,3		
	 memory[15] = 16'b0101000000000010; //J
/*
    //code delay 400ns
    memory[0] = 16'b0001000001000101;  
    memory[1] = 16'b0001000010000001;   
	 memory[2] = 16'b0000001010011010;   
    memory[3] = 16'b0000000011001000;	 
	 memory[4] = 16'b0100000011000001;
	 memory[5] = 16'b0101000000000010;
*/
end

always @(pc_input)
begin
	 instruction_output = memory[pc_input];
end
endmodule




