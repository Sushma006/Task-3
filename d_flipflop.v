//verilog code
module d_flipflop(
    input clk,
    input D,
    output reg Q
);

always @(posedge clk)
begin
    Q <= D;
end
  
endmodule


//Testbench
module tb_d_flipflop;

reg clk;
reg D;
wire Q;

d_flipflop uut(
    .clk(clk),
    .D(D),
    .Q(Q)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_d_flipflop);
end

always #5 clk = ~clk;

initial begin
    clk = 0;
    D = 0;

    #10 D = 1;
    #10 D = 0;
    #10 D = 1;

    #20 $finish;
end

endmodule
