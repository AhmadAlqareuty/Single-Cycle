module Branch_Adder(
    input wire [31:0] PC,
    input wire [31:0] Shifted_Output,
    output wire [31:0] Add_Result
);

assign Add_Result = PC + Shifted_Output;

endmodule

