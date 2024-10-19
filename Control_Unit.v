//          opcode        RegDst      Jump        RegWrite    AluSrc  MemWrite    MemRead     MemToReg    Branch    AluOp                     
// R-Type   000000 (0)    1             0            1         0         0           0           0          0      1 0 0 1  
// LW       100011(23)35  0             0            1         1         0           1           1          0      0 0 1 0
// SW       101011(2b)43  x             0            0         1         1           0           0          0      0 0 1 0  
// Addi     001000(8)     0             0            1         1         0           0           0          0      0 0 0 1
// Beq       000100(4)    x             0            0         0         0           0           0          1      1 0 1 1
// same for jal               
// jump      000010(2)    x             1            0         x         0           0           x          1      1 1 1 1 

// Modification done by Ahmad -> Remove errors and adding assign statements

module Control_Unit (
    input [5:0] opcode,
    output RegDst, Jump, RegWrite, AluSrc, MemWrite, MemRead, MemToReg, Branch, [3:0]AluOp
);
// F opcode[0]
// E opcode[1]
// D opcode[2]
// C opcode[3]
// B opcode[4]
// A opcode[5]
    assign RegDst = ~opcode[5] & ~opcode[3];
    assign Jump = ~opcode[5] & opcode[1];
    assign RegWrite = ~opcode[2] & ~opcode[1] | ~opcode[3] & opcode[0];
    assign AluSrc = opcode[0]|opcode[3];
    assign MemWrite = opcode[3] & opcode[0]; 
    assign MemRead = ~opcode[3] & opcode[0];   
    assign MemToReg = ~opcode[3] & opcode[0];
    assign Branch = opcode[2] | ~opcode[5] & opcode[1];
    assign AluOp = {~opcode[5] & ~opcode[3], ~opcode[5] & opcode[1],opcode[1] |opcode[2],~opcode[5]};

endmodule