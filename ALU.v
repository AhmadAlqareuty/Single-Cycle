module ALU(
input  [31:0] Operand_A,  //src1
input  [31:0] Operand_B,  //src2
input  [3:0] AluAddress, //function sel
output reg [31:0] result,  //result 
output reg zero
);

always @(AluAddress,Operand_A,Operand_B)
begin 
    zero = 1'b0;
    case(AluAddress)
        4'b0001: result = $signed (Operand_A) + $signed (Operand_B); // add
        4'b0011: result = $signed (Operand_A) - $signed (Operand_B); // sub
        4'b0100: result = Operand_A & Operand_B ; //and 
        4'b1000: result = Operand_A | Operand_B; //or
        4'b1100: result = (Operand_A < Operand_B) ? 1:0 ; //slt
        4'b1011 : 
        begin // beq
            zero = (Operand_A == Operand_B) ? 1'b1 : 1'b0;
        end
        4'b1111: //jump
            zero = 1'b1;
        default: result = 32'bx;
    endcase
end
endmodule