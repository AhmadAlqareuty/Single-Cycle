module Sign_Extention(
input wire [15:0] Instruction,//Input that will be extended
output wire [31:0] Extention_out //Output after the extention
);
assign Extention_out = {{16{Instruction[15]}} ,Instruction[15:0]};//will take MSB and see if it's 1,it will extend 1's and if MSB is 0,it will extend 0's
endmodule