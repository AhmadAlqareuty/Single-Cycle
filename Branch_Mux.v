module Branch_Mux(
    input [31:0] PC,
    input [31:0] Add_Result,
    input Branch,
    output [31:0] Branch_Out 
);

assign Branch_Out = (Branch)? Add_Result : PC;
endmodule

