module test_top (
    input sel0, 
    input a0, 
    input b0,
    input sel1, 
    input a1, 
    input b1,
    output out0, 
    output out1
);

    mux2to1 inst0(.sel(sel0), .a(a0), .b(b0), .out(out0));
    mux2to1 inst1(.sel(sel1), .a(a1), .b(b0), .out(out0));

endmodule