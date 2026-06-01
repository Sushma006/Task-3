//Verilog code
module jk_flipflop(
    input clk,
    input J,
    input K,
    output reg Q
);

always @(posedge clk)
begin
    case ({J,K})
        2'b00: Q <= Q;    // No Change
        2'b01: Q <= 0;    // Reset
        2'b10: Q <= 1;    // Set
        2'b11: Q <= ~Q;   // Toggle
    endcase
end

endmodule

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








