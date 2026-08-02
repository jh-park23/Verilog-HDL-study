module vector_scalar_tb;
    reg [10:0] vector_0;
    reg [10:0] vector_1;
    reg vector_0_msb;
    reg vector_0_lsb;
    reg [2:0] vector_0_partial;

    initial begin
        vector_0 = 11'b10101010101;
        vector_1 = vector_0;
        vector_0_msb = vector_0[10];
        vector_0_lsb = vector_0[0];
        vector_0_partial = vector_0[5:3];
        $display("vector_0 = %b, vector_1 = %b, vector_0_msb = %b, vector_0_lsb = %b, vector_0_partial = %b",
                    vector_0, vector_1, vector_0_msb, vector_0_lsb, vector_0_partial);
    end
endmodule