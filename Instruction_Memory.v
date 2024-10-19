module Instruction_Memory(
    input [31:0]PC,
    output [31:0]Instruction
);
//creating a 32*128 array to save instructions
reg [31:0] I_Mem[0:127];

//save the byte addressable instructions in the mem array
initial begin
    $readmemh("Instructions.txt",I_Mem);
end

//assign the instruction the address deppending on the PC (Shift by 2 to go from 0 to 1 instead of 0 to 4)

assign Instruction = I_Mem[PC>>2];



endmodule
