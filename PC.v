module PC(clk,reset,PC,PC_next);
input [7:0] PC_next;
input clk,reset;
output reg [7:0] PC;

always @(posedge clk)  
 begin   
      if(reset)   
           PC <= 8'b00000000;  
      else  
           PC <= PC_next;  
 end
 endmodule
 