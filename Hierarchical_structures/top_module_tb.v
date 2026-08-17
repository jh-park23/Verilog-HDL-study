`define CASCADE_TEST
`timescale 1ns / 1ps

module top_module_tb;
    // Parameters
    parameter WIDTH0 = 8;
    parameter WIDTH1 = 10;

`ifdef CASCADE_TEST
    // Test signals
    reg [WIDTH0-1:0] a0, b0;
    reg [WIDTH1-1:0] a1, b1;
    reg sel0, sel1;
    wire [WIDTH0-1:0] out0;
    wire [WIDTH0-1:0] out1;
    // Instantiate the top_module_cascade
    top_module_cascade #(WIDTH0) u_top_module_cascade_0 (
        .a0(a0),
        .b0(b0),
        .b1(b1),
        .sel0(sel0),
        .sel1(sel1),
        .out0(out0),
        .out1(out1)
    );
initial begin
    $display("Cascade Top Test");
    #0  a0 = 8'd1; b1 = 8'd2; b0 = 8'd3;
        sel1 = 1'b0; sel0 = 1'b0;
    #10 sel1 = 1'b1; sel0 = 1'b0;
    #10 sel1 = 1'b0; sel0 = 1'b1;
    #10 sel1 = 1'b1; sel0 = 1'b1;
    #10 $finish;
end

always  
begin
    #10 $display("------------------------------------------------------------------");
        $display("[%3d] mux_inst_0 : a = %1d, b = %1d, sel = %1b : out = %1d", $time, a0, b0, sel0, out0); 
        $display("      mux_inst_1 : a = %1d, b = %1d, sel = %1b : out = %1d",        out0, b1, sel1, out1);           
end
`else
    // Test signals
    reg [WIDTH0-1:0] a0, b0;
    reg [WIDTH1-1:0] a1, b1;
    reg sel0, sel1;
    wire [WIDTH0-1:0] out0;
    wire [WIDTH1-1:0] out1;
    // INstantiate the top_module_parallel
    // top_module_parallel #(WIDTH0, WIDTH1) //possible
    top_module_parallel #(
        .WIDTH0(WIDTH0), .WIDTH1(WIDTH1)
    )
    u_top_module_parrel_0 (
        .a0(a0),
        .b0(b0),
        .a1(a1),
        .b1(b1),
        .sel0(sel0),
        .sel1(sel1),
        .out0(out0),
        .out1(out1)
    );
    initial
    begin
        $display("Parallel Top Test");
        #0  a0 = 8'd0; a1 = 10'd1; b0 = 8'd2; b1 = 10'd3;
            sel1 = 1'b0; sel0 = 1'b0;
        #10 sel1 = 1'b1; sel0 = 1'b1;
        #10 sel1 = 1'b1; sel0 = 1'b1;
        #10 $finish;
    end

    always
    begin
        #10 $display("-----------------------------------------------------------------------");
            $display("[%3d] mux_inst_0 : a= %1d, b = %1d, sel = %1b : out = %1d", $time,    a0, b0, sel0, out0);
            $display("      mux_inst_1 : a= %1d, b = %1d, sel = %1b : out = %1d",           a1, b1, sel1, out1);
            // Scope Example
            $display("      mux_inst_0 : a[1] = %1d, b[1] = %1d : out[1] = %1d", u_top_module_parrel_0.mux_inst_0.a[1],
                                                                                 u_top_module_parrel_0.mux_inst_0.b[1],
                                                                                 u_top_module_parrel_0.mux_inst_0.out[1]);
            $display("      mux_inst_1 : a[1] = %1d, b[1] = %1d : out[1] = %1d", u_top_module_parrel_0.mux_inst_1.a[1],
                                                                                 u_top_module_parrel_0.mux_inst_1.b[1],
                                                                                 u_top_module_parrel_0.mux_inst_1.out[1]);
    end
`endif 
endmodule