module  top_module_cascade #(parameter WIDTH = 8) (
    input [WIDTH-1:0] a0, b0, b1,
    input sel0, sel1,
    output [WIDTH-1:0] out0,out1
);
    // Example Cascade Architecture
    mux2to1 #(.WIDTH(WIDTH)) mux_inst_0 (.out(out0), .a(a0), .b(b0), .sel(sel0));
    mux2to1 #(.WIDTH(WIDTH)) mux_inst_1 (.out(out1), .a(out0), .b(b1), .sel(sel1));
endmodule