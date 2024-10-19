module Reg_Mux(
    input [4:0]rt,
    input [4:0]rd,
    input RegDst,
    output [4:0]WriteReg
);

assign WriteReg = (RegDst)? rd : rt;

endmodule