/*
modifications done to the register file are:
1)Removing all the regsters and declaring them all as just input and output wires 
2)puting the always statement on the write data only rather than on the read and write
3)adding a clock to the register file so that it doesnt keep looping when reading and writing and always start writing on the next positive edge of a clock
*/
module Register_File(//added clock for read and write sequence
input clk,
input Reg_write,
input [4:0] Read_Register1,//RS 
input [4:0] Read_Register2,//RT
input [4:0] Write_Register,//RD
input [31:0] Write_data,//The data that will be written in a the speicfied register according to Write_Register
output reg [31:0] Read_data1,//Output comming from Read_Register1
output reg [31:0] Read_data2 //Output comming from Read_Register2
);
reg [31:0] registers [0:31];
initial begin
$readmemh("registers.txt",registers);
end
    always@(Read_Register1 or Read_Register2 or Write_Register)begin
            Read_data1<=registers[Read_Register1];
            Read_data2<=registers[Read_Register2];
    end
    always @(posedge clk) begin
        if(Reg_write==1)begin //write
                registers[Write_Register] = Write_data;
        end
    end

endmodule