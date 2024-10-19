module Jump_Concat(
input wire [25:0] Immediate,//Input that will be extended
input wire [3:0] PC,
output wire [31:0] Jump_Address //Output after the extention
);
assign Jump_Address = {PC ,Immediate,2'b0};//will take MSB and see if it's 1,it will extend 1's and if MSB is 0,it will extend 0's
endmodule
