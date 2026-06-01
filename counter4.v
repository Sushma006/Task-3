//Veriolg
module counter4(
    input clk,
    output reg [3:0] count
);

always @(posedge clk)
begin
    count <= count + 1;
end

initial begin
    count = 4'b0000;
end

endmodule
