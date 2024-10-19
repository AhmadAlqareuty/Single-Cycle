module ALU_Mux(
    input [31:0] Read_Data2,
    input [31:0] Sign_Extention,
    input AluSrc,
    output [31:0] Operand_B 
);

assign Operand_B = (AluSrc)? Sign_Extention : Read_Data2;

endmodule
