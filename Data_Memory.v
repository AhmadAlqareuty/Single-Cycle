module Data_Memory (
    input wire [31:0]Address,Write_data,
    input wire Mem_Read,Mem_Write,
    output reg [31:0]Read_Data
);
reg [31:0] D_mem [0:127]; //The memory in the module
initial begin
    $readmemh("Data_Memory.txt",D_mem);
end
always @(Address or Write_data)begin
    if(Mem_Read==1 & Mem_Write==0) begin //Read case
    Read_Data<=D_mem[Address>>2];
    end
    if(Mem_Read==0 & Mem_Write==1)begin //Write case
        D_mem[Address>>2]<=Write_data;
    end
    $writememh("Data_Memory_after_run.txt",D_mem);//Write the result after run in a seperate file from that once is read
end
endmodule