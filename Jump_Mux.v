module Jump_Mux(
    input [31:0] Jump_Address,
    input [31:0] Branch_Out,
    input Jump,
    output [31:0] PC_Next 
);

assign PC_Next = (Jump)? Jump_Address : Branch_Out;
endmodule