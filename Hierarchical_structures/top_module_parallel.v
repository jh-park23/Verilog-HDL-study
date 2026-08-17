module top_module_parallel #(parameter WIDTH0 = 8, WIDTH1 = 8) (
    input [WIDTH0-1:0] a0, b0,
    input [WIDTH1-1:0] a1, b1,
    input sel0, sel1,
    output [WIDTH0-1:0] out0,
    output [WIDTH1-1:0] out1
);
    // Example Parallel Architecture
    mux2to1 #(.WIDTH(WIDTH0)) mux_inst_0 (.out(out0), .a(a0), .b(b0), .sel(sel0));
    mux2to1 #(.WIDTH(WIDTH1)) mux_inst_1 (.out(out1), .a(a1), .b(b1), .sel(sel1));
endmodule