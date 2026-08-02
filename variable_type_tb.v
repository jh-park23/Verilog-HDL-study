module variable_type_tb;
    reg bit_reg;
    wire bit_wire = bit_reg; //to check continuous
    reg signed [7:0] signed_byte_reg;
    reg [7:0] unsigned_byte_reg;
    integer value_integer;
    real value_real;
    reg signed [31:0] signed_32bit_reg;
    reg [63:0] unsigned_64bit_reg;
    time value_time;
    realtime value_realtime;

    initial begin
        $monitor("Time: %0t | bit_reg = %b, bit_wire = %b", $time, bit_reg, bit_wire);
        bit_reg = 1'b1;
        signed_byte_reg = 8'sb11110000;
        unsigned_byte_reg = 8'b11110000;
        value_integer = 12345;
        value_real = 3.14159;
        signed_32bit_reg = -32'sd1024;
        unsigned_64bit_reg = 64'hFFFFFFFFFFFFFFFF;
        value_time = $time;
        value_realtime = $realtime;

        $display("signed_byte_reg = %d, unsigned_byte_reg = %b", signed_byte_reg, unsigned_byte_reg);
        $display("value_integer = %d, value_real = %f, signed_32bit_reg = %d, unsigned_64bit_reg = %h", value_integer, value_real, signed_32bit_reg, unsigned_64bit_reg);
        $display("value_time = %t", value_time);
        $display("value_realtime", value_realtime);

        #10 bit_reg = 1'b0;
    end
    
endmodule