module Alu_Control (
    input [5:0] funct,
    input [3:0] alu_op,
    output reg [3:0] AluAddress
);

always @(*) begin
    case(alu_op)
        4'b0010:assign AluAddress = 4'b0001; // lw/sw
        4'b0001:assign AluAddress = 4'b0001; // Addi
        4'b1011:assign AluAddress = 4'b1011; // Beq
        4'b1111:assign AluAddress = 4'b1111; // jump
        4'b1001: begin
            case(funct)
                6'b100000:assign AluAddress = 4'b0001; // add
                6'b100010:assign AluAddress = 4'b0011; // sub
                6'b100100:assign AluAddress = 4'b0100; // and
                6'b100101:assign AluAddress = 4'b1000; // or
                6'b101010:assign AluAddress = 4'b1100; // slt
                default: assign AluAddress = 4'bxxxx;   // Undefined
            endcase
        end
        default:assign AluAddress = 4'bxxxx; // Undefined
    endcase
end

endmodule
