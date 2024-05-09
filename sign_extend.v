module sign_extend(
    input [5:0] input_value, // Input số cần mở rộng (6-bit số có dấu)
    output reg [7:0] output_value // Output số đã được mở rộng (8-bit số có dấu)
);

always @ (*)
begin
    if(input_value[5] == 0)
	 output_value = { {input_value[5]},{input_value[5]}, input_value};
	 else 
	 output_value = { {~input_value[5]},{~input_value[5]}, input_value};
	 //output_value = { 1'b1,1'b1, input_value};
    end
    // Đưa ra giá trị mở rộng với kích thước là 8 bit
    //output_value = { {2{sign_bit}}, input_value }; // Mở rộng 6 bit lên 8 bit
endmodule 

