module expression_type_tb;
     // Declare the registers
    reg [7:0] unsigned_val;
    reg signed [7:0] signed_val;
    initial begin
        // Example 1: Assigning unsigned(-4) to a signed register
        signed_val = $unsigned(-4);
        $display("signed_val = $unsigned(-4): %0d (in hex: %h)", signed_val, signed_val);

        // Example 2: Assigning signed(4'b1100) to a signed register
        signed_val = $signed(4'b1100);
        $display("signed_val = $signed(4'b1100): %0d (in hex: %h)", signed_val, signed_val);

        // Example 3: Direc assignment without $signed or $unsigned
        signed_val = 4'b1100;
        $display("signed_val = 4'b1100: %0d (in hex: %h)", signed_val, signed_val);

        // Example 4: Assigning signed(-4) to an unsigned register
        unsigned_val = $signed(-4);
        $display("unsigned_val = $signed(-4): %0d (in hex: %h)", unsigned_val, unsigned_val);

        // Example 5: Assigning signed(4'b1100) to an unsigned register
        unsigned_val = $signed(4'b1100);
        $display("unsigned_val = $signed(4'b1100): %0d (in hex: %h)", unsigned_val, unsigned_val);
    end
endmodule