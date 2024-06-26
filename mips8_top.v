module mips8 ( input clk,reset,
              output[7:0] alu_result, R2,
		        output[7:0] pc_out, read_dataB, reg_read_data_A,  
				  output wire [7:0] reg_read_data_B, R1,
				  output [2:0] ALU_Control,
				  output zero_flag, branch, mem_read, mem_write, reg_dst,reg_write
  );  
 wire  [15:0] instr; 
 wire mem_to_reg;  
 wire jump,alu_src     ;  // branch //mem_read,mem_write,reg_write
 wire     [2:0]     write_reg_address;      // lua chon dia chi rd
 wire     [7:0]     write_reg_data; //WD3 
 wire     [2:0]     reg_read_addr_A; // wire     [7:0]     reg_read_data_A;  //RD1
 wire     [2:0]     reg_read_addr_B;  
 //wire     [7:0]     reg_read_data_B;  //RD2
 wire     [7:0]     sign_ext_im; // output immediate 6bit -> 8bit
 wire     [7:0]     ALU_out;
 //wire               zero_flag; // , branch_check
 //reg      [7:0]     pc_wire, pc_next;
 //reg      [7:0]     pc_jump;
 reg      [7:0]     pc_current,pc_next; 

 initial begin
		pc_current <= 8'b00000000;
		end
 	
 always @(posedge clk)  
 begin   
		if(reset == 1)
			  pc_current <= 8'd0; 
		else
           pc_current <= pc_next;
 end
 
 instruction_memory instr_mem(.pc_input(pc_current),
                              .instruction_output(instr));  //in(out)
										
 control_unit control(.reset(reset),.opcode(instr[14:12]),.reg_dst(reg_dst)  
                ,.mem_to_reg(mem_to_reg),.jump(jump),.branch(branch),.mem_read(mem_read),  
                .mem_write(mem_write),.alu_src(alu_src),.reg_write(reg_write));  //.alu_op(alu_op)
 always @(*)
 begin
      if((branch & zero_flag) == 1)
			  pc_next <= pc_current + sign_ext_im + 8'd1; 
		else if (jump == 1)
           pc_next <= sign_ext_im; 
		else pc_next <= pc_current + 8'd1; 		  
 end 
					 
 assign write_reg_address = (reg_dst == 1'b0) ? instr [8:6] : instr [5:3]; // chon dia chi rd
 assign reg_read_addr_A = instr[11:9];  // dia chi doc register A va B
 assign reg_read_addr_B = instr[8:6];
 
 register_file reg_file(.clk(clk),.rst(reset),.reg_write_en(reg_write), // Enable write từ control unit  
                        .reg_write_dest(write_reg_address),  // Dia chi rd
                        .reg_write_data(write_reg_data),     // Data in rd
                        .reg_read_addr_1(reg_read_addr_A),  
                        .reg_read_data_1(reg_read_data_A),  
                        .reg_read_addr_2(reg_read_addr_B),  
                        .reg_read_data_2(reg_read_data_B),
								.R2(R2),
								.R1(R1));
 
 
 sign_extend sign_ext(.input_value(instr[5:0]), .output_value(sign_ext_im)); // Extend dau
 
 alu_control ALU_Control_unit(.Opcode(instr[14:12]),.funct_in(instr[2:0]),.ALU_Funct(ALU_Control)); // ALU control
 
 assign read_dataB = (alu_src == 1'b1) ? sign_ext_im : reg_read_data_B; // Chon toan hang B = reg hay bang immediate
 
 alu alu_unit(.A(reg_read_data_A),.B(read_dataB),.Funct(ALU_Control),.ALU_result(ALU_out),.Zero(zero_flag), .Cout(cout));
 
 data_memory datamem(.clk(clk),.address(ALU_out),  
 .data_in(reg_read_data_B),.write_enable(mem_write),.read_enable(mem_read),  
 .data_out(mem_read_data));  // Data memory
 
 assign write_reg_data = (mem_to_reg == 1'b0) ? ALU_out : mem_read_data; // input cho WD3
 assign pc_out = pc_current;  
 assign alu_result = ALU_out;  
 endmodule
 /*

 module mips8( input clk,reset,
              output[7:0] pc_out, alu_result                          
   );  
 wire [15:0] instr; 
 wire reg_dst,mem_to_reg;  
 wire jump,branch,mem_read,mem_write,alu_src,reg_write     ;  
 wire     [2:0]     write_reg_address;      // lua chon dia chi rd
 wire     [7:0]     write_reg_data; //WD3 
 wire     [2:0]     reg_read_addr_A;  
 wire     [7:0]     reg_read_data_A;  //RD1
 wire     [2:0]     reg_read_addr_B;  
 wire     [7:0]     reg_read_data_B;  //RD2
 wire     [7:0]     sign_ext_im; // output immediate 6bit -> 8bit
 wire     [2:0]     ALU_Control; // Control ALU function
 wire     [7:0]     read_dataB; //Chon input B = reg hay bang immediate
 wire     [7:0]     ALU_out;
 wire               zero_flag;
 wire     [7:0]     pc_wire;
 wire     [7:0]     pc_jump;
 wire      [7:0]    pc_current; 
  

 /*
 always @(posedge clk or posedge reset)  
 begin   
      if(reset)   
           pc_current <= 8'd0;  
      else  
           pc_current <= pc_next;  
 end
 
 
 PC pc(.PC(pc_current),.clk(clk),.reset(reset),.PC_next(PCplus1));
 
 //assign pc2 = pc_current + 8'd1; // Update PC
 PC_adder pcadder(.C(PCplus1),.A(pc_current),.B(8'b00000001));
 
 instruction_memory instr_mem(.pc_input(pc_current),
                              .instruction_output(instr));  //in(out)
 // assign jump_shift_1 = {instr[6:0],1'b0,1'b0}; // Shift left 2
 
 control_unit control(.reset(reset),.opcode(instr[14:12]),.reg_dst(reg_dst)  
                ,.mem_to_reg(mem_to_reg),.jump(jump),.branch(branch),.mem_read(mem_read),  
                .mem_write(mem_write),.alu_src(alu_src),.reg_write(reg_write));  //.alu_op(alu_op)
					 
 assign write_reg_address = (reg_dst==1'b0) ? instr[8:6] : instr[6:3]; // chon dia chi rd
 assign reg_read_addr_A = instr[11:9];  // dia chi doc register A va B
 assign reg_read_addr_B = instr[8:6];
 
 register_file reg_file(.clk(clk),.rst(reset),.reg_write_en(reg_write), // Enable write từ control unit  
                        .reg_write_dest(write_reg_address),  // Dia chi rd
                        .reg_write_data(write_reg_data),     // Data in rd
                        .reg_read_addr_1(reg_read_addr_A),  
                        .reg_read_data_1(reg_read_data_A),  
                        .reg_read_addr_2(reg_read_addr_B),  
                        .reg_read_data_2(reg_read_data_B));
 
 sign_extend sign_ext(.input_value(instr[5:0]), .output_value(sign_ext_im)); // Extend dau
 alu_control ALU_Control_unit(.Opcode(alu_op),.funct_in(instr[2:0]),.ALU_Funct(ALU_Control)); // ALU control
 assign read_dataB = (alu_src == 1'b1) ? sign_ext_im : reg_read_data_B; // Chon toan hang B = reg hay bang immediate
 alu alu_unit(.A(reg_read_data_A),.B(read_dataB),.Funct(ALU_Control),.ALU_result(ALU_out),.Zero(zero_flag), .Cout(cout));
 //assign im_shift_1 = {sign_ext_im[6:0],1'b0}; // shift 1
  /*
 assign pc_wire = ((branch & zero_flag) == 0) ? PCplus1 : (pc_current + sign_ext_im); // chon PC = PC + 1 hay chon branch PC = PC + immediate
 assign pc_jump = sign_ext_im; // chon lenh jump PC = immediate
 assign pc_next = (jump == 1) ? pc_jump : pc_wire; // chon PC = PC + 1 hay PC + immediate hay Jump
//
 data_memory datamem(.clk(clk),.address(ALU_out),  
 .data_in(reg_read_data_B),.write_enable(mem_write),.read_enable(mem_read),  
 .data_out(mem_read_data));  // Data memory
 
 assign write_reg_data = (mem_to_reg == 1'b0) ? ALU_out : mem_read_data; // input cho WD3
 

 assign pc_out = pc_current;  
 assign alu_result = ALU_out;  
 endmodule
 
 
 */
 /*
 40
 assign pc2 = pc_current + 8'd1; // Update PC
 assign pc_branch =  pc_current + sign_ext_im; // chon PC = PC + 1 hay chon branch PC = PC + immediate
 assign pc_jump = sign_ext_im; // chon lenh jump PC = immediate
 */
 /*
 always @(posedge clk)  
 begin   
		if((branch & zero_flag) == 1)
			  pc_next <= pc_current + sign_ext_im; 
		else if (jump == 1)
           pc_next <= sign_ext_im; 
		else pc_next <= pc_current + 8'd1; 
 end
 //.branch_check(branch_check)
 //assign im_shift_1 = {sign_ext_im[6:0],1'b0}; // shift 1
 /*
 assign pc_wire =  ((branch & zero_flag) == 0) ? pc2 : (pc_current + sign_ext_im); // chon PC = PC + 1 hay chon branch PC = PC + immediate
 assign pc_jump = sign_ext_im; // chon lenh jump PC = immediate
 assign pc_next1 = (jump == 1) ? pc_jump : pc_wire; // chon PC = PC + 1 hay PC + immediate hay Jump   
 assign pc_next = (reset == 1) ? 8'd0 : pc_next1;
 
 assign branch_control =  branch & zero_flag;
 assign pc_branch = pc_current + sign_ext_im;
 
 Mux2to1_8bit  x1(.s0(branch_control),.I0(pc2),.I1(pc_current + sign_ext_im),.out(pc_wire));
 Mux2to1_8bit  x2(.s0(jump),.I0(pc_wire),.I1(sign_ext_im),.out(pc_next));
 */ 
 //wire     [2:0]     ALU_Control; // Control ALU function
 //wire     [7:0]     read_dataB; //Chon input B = reg hay bang immediate