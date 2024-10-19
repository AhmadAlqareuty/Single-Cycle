module Branch_And(
    input wire Branch,
    input wire Zero,
    output wire jump
);

assign jump = Branch & Zero;

endmodule
