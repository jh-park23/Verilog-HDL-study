module parameter_tb;
    parameter MEM_WIDTH = 32;
    parameter MEM_DEPTH_BIT = 10;
    parameter MEM_DEPTH = 1 << MEM_DEPTH_BIT;

    reg [MEM_WIDTH-1:0] memory_data[0:MEM_DEPTH-1];

    initial begin
        memory_data[0] = 32'hDEADBEEF;
        memory_data[1] = 32'hCAFEBABE;
        $display("Memory data[0] = %h", memory_data[0]);
        $display("Memory data[1] = %h", memory_data[1]);
    end
endmodule