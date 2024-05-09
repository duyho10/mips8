/*
`timescale 1ns / 1ps
 
 module mips8;  
      // Inputs  
      reg clk;  
      reg reset; 
      // Outputs 	
      wire [7:0] pc_out;  
      wire [7:0] alu_result;  
		
       
      mips8_top uut (  
           .clk(clk),   
           .reset(reset),   
           .pc_out(pc_out),   
           .alu_result(alu_result)  
            
      );  
      initial begin  
            clk = 0;  
   #10   clk = ~clk;  
      end  
      initial begin  
           // Initialize Inputs  
           //$monitor ("register 3=%d, register 4=%d", reg3,reg4);  
           reset = 1;  
           // Wait 100 ns for global reset to finish  
   #100    reset = 0;  
           // Add stimulus here  
      end  
 endmodule  
 /*
 module mips8;

  // Parameters
  parameter CLK_PERIOD = 10;   // Clock period in ns
  parameter RESET_PERIOD = 100; // Reset period in ns

  // Inputs
  reg clk = 0;
  reg reset = 1;

  // Outputs
  wire [7:0] pc_out;
  wire [7:0] alu_result;

  // Instantiate the DUT

  mips8_top dut (
    .clk(clk),
    .reset(reset),
    .pc_out(pc_out),
    .alu_result(alu_result)
  );

  // Clock generator
  always #(`CLK_PERIOD - 5) 
  clk = ~clk;

  // Reset generation
  initial begin
    #(`RESET_PERIOD + 0) reset = 0; // Assert reset
    #(`RESET_PERIOD + 0) reset = 1; // De-assert reset
  end

  // Stimulus
  initial begin
    // Test Case 1: Load immediate 8 into register R2
    // Instruction: LI R2, 8 (Opcode: 000, RD: 010, Immediate: 0000001000)
    // Expected: R2 = 8, ALU Result = 8
    #100;
    $display("Test Case 1: Load immediate 8 into register R2");
    $display("Initial PC = %d", pc_out);
    $display("Initial ALU Result = %d", alu_result);

    // Test Case 2: Add R2 with R2 (R2 = R2 + R2)
    // Instruction: ADD R2, R2, R2 (Opcode: 001, RD: 010, RS: 010, RT: 010, Funct: 000)
    // Expected: R2 = 8 + 8 = 16, ALU Result = 16
    #100;
    $display("Test Case 2: Add R2 with R2");
    $display("After ADD, R2 = %d", pc_out);
    $display("ALU Result = %d", alu_result);

    // Add more test cases as needed

    $finish;
  end

endmodule
*/