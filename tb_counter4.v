//Testbench
module tb_counter4;

reg clk;
wire [3:0] count;

counter4 uut(
    .clk(clk),
    .count(count)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_counter4);
end

always #5 clk = ~clk;

initial begin
    clk = 0;

    #100;
    $finish;
end

endmodule
