module register_file
 (  
      input                    clk,  
      input                    rst,   
      input                    reg_write_en,  
      input          [2:0]     reg_write_dest,  
      input          [7:0]     reg_write_data,   
      input          [2:0]     reg_read_addr_1,  
      output         [7:0]     reg_read_data_1,    
      input          [2:0]     reg_read_addr_2,  
      output         [7:0]     reg_read_data_2, 
	   output reg     [7:0] R2, R1, R4, R7, R0	
 );  
      reg     [7:0]     reg_array [7:0];   
      always @ (posedge clk or posedge rst) begin  
           if(rst==1) begin  
                reg_array[0] <= 8'b0;  
                reg_array[1] <= 8'd10;  
                reg_array[2] <= 8'd0;  
                reg_array[3] <= 8'd9;
                reg_array[4] <= 8'd10;  
                reg_array[5] <= 8'd255;  
                reg_array[6] <= 8'd8;  
                reg_array[7] <= 8'd1;       
           end  
           else begin  
                if((reg_write_en == 1)) begin
                     reg_array[reg_write_dest] <= reg_write_data;  
                end  
           end  
      end
      always@ (*) begin
           R2 <= reg_array[2];
			  R1 <= reg_array[1];
			  R4 <= reg_array[4];
			  R7 <= reg_array[7];
			  R0 <= reg_array[0]; 
			/*
			if(reg_read_addr_2 == 0)
			   reg_read_data_2 = 8'b0;
			else reg_read_data_2 = reg_array[reg_read_addr_2]; 
			*/	
			end
      assign reg_read_data_1 = ( reg_read_addr_1 == 0)? 8'b0 : reg_array[reg_read_addr_1];  
      assign reg_read_data_2 = ( reg_read_addr_2 == 0)? 8'b0 : reg_array[reg_read_addr_2];		
 endmodule
 