module Data_Memory_Mux(
input [31:0] Read_Data,
input [31:0] Alu_Result,
input MemtoReg,
output [31:0] Write_Data
);
assign Write_Data =(MemtoReg)?Read_Data : Alu_Result;

endmodule
