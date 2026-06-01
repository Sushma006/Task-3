//Testbench
module tb_jk_flipflop;

reg clk;
reg J;
reg K;
wire Q;

jk_flipflop uut(
    .clk(clk),
    .J(J),
    .K(K),
    .Q(Q)
);

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_jk_flipflop);
end

always #5 clk = ~clk;

initial begin
    clk = 0;

    // No Change
    J = 0; K = 0;
    #10;

    // Reset
    J = 0; K = 1;
    #10;

    // Set
    J = 1; K = 0;
    #10;

    // Toggle
    J = 1; K = 1;
    #10;

    // Toggle again
    J = 1; K = 1;
    #10;

    $finish;
end

endmodule

