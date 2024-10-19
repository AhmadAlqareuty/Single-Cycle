module Shift_Left_2(
    input wire [31:0] Sign_Extention,
    output wire [31:0] Shifted_Output
);
assign Shifted_Output = Sign_Extention << 2;
endmodule

