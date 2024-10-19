`timescale 1ps/1ps

module Big_Test();
// Parameters
parameter clock_period = 10;

// Clock and reset
reg clk=1;
reg Reset = 1;

// Wires for interconnecting modules
wire [31:0] PC, PC_Next,PC_Four;
wire [31:0] Instruction, Branch_Out, Read_Data1, Read_Data2, Extention_out, Operand_B, Result, Shifted_Output, Add_Result, Read_Data, Write_Data, Jump_Address;
wire RegDst, Jump, RegWrite, AluSrc, MemWrite, MemRead, MemToReg, Branch, Zero, And_Out;
wire [3:0] AluOp, AluAddress;
wire [4:0] WriteReg;

// Assignments

// Instantiations

// Program Counter and Instruction Fetch
PC pc(clk, Reset, PC_Next, PC);
PC_Adder pa(PC,PC_Four);
Instruction_Memory IM(PC, Instruction);

// Control Unit and Register Operations
Control_Unit CU(Instruction[31:26], RegDst, Jump, RegWrite, AluSrc, MemWrite, MemRead, MemToReg, Branch, AluOp);
Reg_Mux RM(Instruction[20:16], Instruction[15:11], RegDst, WriteReg);
Sign_Extention SE(Instruction[15:0], Extention_out);
Register_File RF(clk, RegWrite, Instruction[25:21], Instruction[20:16], WriteReg, Write_Data, Read_Data1, Read_Data2);

// ALU Operations
Alu_Control ALUC(Instruction[5:0], AluOp, AluAddress);
ALU_Mux ALUM(Read_Data2, Extention_out, AluSrc, Operand_B);
ALU ALU(Read_Data1, Operand_B, AluAddress, Result, Zero);

// Memory Operations
Data_Memory DM(Result, Read_Data2, MemRead, MemWrite, Read_Data);
Data_Memory_Mux DMM(Read_Data, Result, MemToReg, Write_Data);

// Branching and Jump Logic
Shift_Left_2 SL2(Extention_out, Shifted_Output);
Jump_Concat JC(Instruction[25:0], PC_Four[31:28], Jump_Address);
Branch_Adder BAD(PC_Four, Shifted_Output, Add_Result);
Branch_And BA(Branch, Zero, And_Out);
Branch_Mux BM(PC_Four, Add_Result, And_Out, Branch_Out);
Jump_Mux JM(Jump_Address, Branch_Out, Jump, PC_Next);



// Clock generation
always begin
    #1 clk = ~clk;
end

// Initial block for simulation
initial begin
    #1;
    Reset = 0;
    #150; // Total simulation time
end

endmodule
