module PC_Adder(
    input [31:0] PC,
    output [31:0] PC_Next);

assign PC_Next = PC+4;

endmodule 

