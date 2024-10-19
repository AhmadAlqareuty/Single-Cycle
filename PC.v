/*The modifications was done in the code:
1-Putting PC_NEXT as a normal variable insted of an input
2-Putting addition by 4 for PC_NEXT in the always non blocking statement
3-Declerating clk as wire
*/

/*
1)Other modifications done are Adding reset 
2)adding a new input which is PC_Next that comes for the jump mux
*/
module PC (
    input wire clk,
    input wire Reset,
    input reg [31:0] PC_Next,
    output reg [31:0] PC
);
    always @(posedge clk)
    begin
        if(Reset)
            PC <= 32'b0;
        else
            PC <= PC_Next;
    end 
endmodule