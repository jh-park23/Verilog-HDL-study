`define ARITHMETIC_OPERATOR_TEST
`define RELATIONAL_OPERATOR_TEST
`define EQUALITY_OPERATOR_TEST
`define LOGICAL_OPERATOR_TEST
`define BITWISE_OPERATOR_TEST
`define REDUCTION_OPERATOR_TEST
`define SHIFT_OPERATOR_TEST
`define CONDITON_OPERATOR_TEST
`define CONCATENATION_OPERATOR_TEST
`define REPLICATION_OPERATOR_TEST
`define EVENT_OPERATOR_TEST

module operator_tb;
`ifdef ARITHMETIC_OPERATOR_TEST
    reg signed [31:0] arith_a, arith_b;
    reg signed [31:0] arith_result;

    initial begin
        $display("Arithmetic Operation Example");
        // Test Addition
        arith_a = 32'd10;
        arith_b = 32'd3;
        arith_result = arith_a + arith_b;
        $display("arith_a + arith_b = %0d + %0d = %0d", arith_a, arith_b, arith_result);

        // Test Subtraction
        arith_result = arith_a - arith_b;
        $display("arith_a - arith_b = %0d - %0d = %0d", arith_a, arith_b, arith_result);

        //Test Multiplication
        arith_result = arith_a*arith_b;
        $display("arith_a * arith_b = %0d * %0d = %0d", arith_a, arith_b, arith_result);

        // Test Division
        arith_result = -32'sd12 / 32'sd3;
        $display("-12 / 3 = %0d", arith_result);

        // Test Division with a larger negative number
        arith_result = 32'd12/32'd3;
        $display("32'b1111_1111_1111_1111_1111_1111_1111_0100(-12) /3 = %b", arith_result);

        //Test Modulo
        arith_result = -32'sd10 % 32'sd3;
        $display("10 %% -3 = %0d", arith_result);

        arith_result = 32'sd10 % -32'sd3;
        $display("10 %% -3 = %0d", arith_result);

        // Test Power
        arith_result = -32'sd4 ** 32'sd2;
        $display("-4 ** 2 = %0d", arith_result);

        arith_result = -32'sd4 ** 32'sd3;
        $display(" -4 ** 3 = %0d", arith_result);

        // Test with Unknowns (x) and High-impedance (Z)
        arith_a = 32'hx;
        arith_b = 32'd3;
        arith_result =  arith_a + arith_b;
        $display("arith_a (z) * arith_b = %0x * %0d = %0x", arith_a, arith_b, arith_result);

        arith_a = 32'hz;
        arith_result = arith_a * arith_b;
        $display("arith_a (z) * arith_b = %0x * %0d = %0x", arith_a, arith_b, arith_result);
    end
`endif
`ifdef RELATIONAL_OPERATOR_TEST
    reg [7:0] rel_reg_8bit;
    reg [3:0] rel_reg_4bit;
    reg signed [7:0] rel_reg_s_8bit;
    reg signed [3:0] rel_reg_s_4bit;
    reg rel_reg_result;

    initial begin
        $display("Relational Operation Example");
        rel_reg_8bit = 8'b1000_0000; // 128
        rel_reg_4bit = 4'b0010;
        $display("%0d, %0d", rel_reg_8bit, rel_reg_4bit);

        rel_reg_result = (rel_reg_8bit < rel_reg_4bit);
        $display("%0b is the result of (rel_reg_8bit < rel_reg_4bit)", rel_reg_result);

        rel_reg_result = (rel_reg_8bit > rel_reg_4bit);
        $display("%0b is the result of (rel_reg_8bit > rel_reg_4bit)", rel_reg_result);

        rel_reg_8bit = 8'b0000_0010; // 2
        rel_reg_4bit = 4'b1000; // 8
        $display("%0d, %0d", rel_reg_8bit, rel_reg_4bit);

        rel_reg_result = (rel_reg_8bit < rel_reg_4bit);
        $display("%0b is the result of (rel_reg_8bit < rel_reg_4bit)", rel_reg_result);

        rel_reg_result = (rel_reg_8bit > rel_reg_4bit);
        $display("%0b is the result of (rel_reg_8bit < rel_reg_4bit)", rel_reg_result);

        rel_reg_8bit =  8'b0000_1000; // 8
        rel_reg_s_4bit = 4'b1111; // -1
        $display("%0d, %0d", rel_reg_8bit, rel_reg_s_4bit);

        rel_reg_result = (rel_reg_s_8bit < rel_reg_s_4bit);
        $display("%0b is the result of (rel_reg_s_8bit < rel_reg_s_4bit)", rel_reg_result);

        rel_reg_result = (rel_reg_s_8bit > rel_reg_s_4bit);
        $display("%0b is the result of (rel_reg_s_8bit > rel_reg_s_4bit)", rel_reg_result);
    end
`endif
`ifdef EQUALITY_OPERATOR_TEST
    reg [7:0] eq_case_val0;
    reg [7:0] eq_case_val1;
    reg [7:0] eq_case_val2;
    initial begin
        $display("Equality Operation Example");
        eq_case_val0 = 8'b0000_01xz;
        eq_case_val1 = 8'b0000_01xz;
        eq_case_val2 = 8'b0000_01xx;
        $display("Comparing %b and %b", eq_case_val0, eq_case_val1);
        $display("(eq_case_val0 == eq_case_val1) = %b", eq_case_val0 == eq_case_val1);
        $display("(eq_case_val0 === eq_case_val1) = %b", eq_case_val0 === eq_case_val1);
        $display("Comparing %b and %b", eq_case_val0, eq_case_val2);
        $display("(eq_case_val0 == eq_case_val2) = %b", eq_case_val0 == eq_case_val2);
        $display("(eq_case_val0 === eq_case_val2) = %b", eq_case_val0 === eq_case_val2);
    end
`endif 
`ifdef LOGICAL_OPERATOR_TEST
    reg [7:0] log_A, log_B;
    reg log_result;

    initial begin
        $display("Logical Operation Example");
        // Test AND (&&) and OR (||) logical operations
        log_A = 8'hff; // A is all 1s (255)
        log_B = 8'h00; // B is all 0s (0)

        // Logical AND
        log_result = log_A && log_B;
        $display("log_A && log_B = %b", log_result); // Expected: 0

        // Logical OR
        log_result = log_A || log_B;
        $display(" log_A || log_B = %b", log_result); // Expected: 1

        // Test NOT (!) logical operation
        // Logical NOT on A (all 1s)
        log_result = !log_A;
        $display("!log_A = %b (false)", log_result); // Expected: 0 (false)

        // Logical NOT on B (all 0s)
        log_result = !log_B;
        $display("!log_B = %b (true)", log_result); // Expected: 1 (true)
    end
`endif
`ifdef BITWISE_OPERATOR_TEST
    reg [3:0] bitwise_A, bitwise_B, bitwise_C;
    reg [3:0] bitwise_result;

    initial begin
        $display("Bit-wise Operation Example");
        // Initialize the values
        bitwise_A = 4'b01xz;
        bitwise_B = 4'b1111;
        bitwise_C = 4'b0000;

        // perform bitwise OR between A and B
        bitwise_result = bitwise_A | bitwise_B;
        $display("bitwise_A | bitwise_B = %b (Expected: 1111)", bitwise_result);

        // perform bitwise AND between A and B
        bitwise_result = bitwise_A & bitwise_B;
        $display("bitwise_A & bitwise_B = %b (Expected: 01xx)", bitwise_result);

        // perform bitwise OR between A and C
        bitwise_result = bitwise_A | bitwise_C;
        $display("bitwise_A | bitwise_C = %b (Expected: 01xx)", bitwise_result);

        // perform bitwise AND between A and C
        bitwise_result = bitwise_A & bitwise_C;
        $display("bitwise_A & bitwise_C = %b (Expected: 0000)", bitwise_result);
    end
`endif
`ifdef REDUCTION_OPERATOR_TEST
    reg [3:0] red_A;
    reg red_result;

    initial begin
        $display("Reduction Operation Example");
        // Initialize the value of A
        red_A = 4'b0101;

        // Reduction OR operation
        red_result = |red_A;
        $display("|red_A = %b (Reduction OR)", red_result); // Expected: 1

        //Reduction AND operation
        red_result = &red_A;
        $display("&red_A = %b (Reduction AND)", red_result); // Expected: 0

        // Reduction XOR operation
        red_result = ^red_A;
        $display("^red_A = %b (Reduction XOR)", red_result); //Expected: 0
    end
`endif
`ifdef CONDITON_OPERATOR_TEST
    reg [31:0] cond_a, cond_b;
    reg [31:0] cond_result;
    reg cond_condition;
    reg [31:0] cond_input_val;

    initial begin
        $display("Condition Operation Example");
        // Example 1: Basic Condition Operation
        cond_a = 32'd15;
        cond_b = 32'd10;

        // (cond_a > cond_b) ? cond_a : cond_b;
        cond_result = (cond_a > cond_b) ? cond_a : cond_b;
        $display("cond_result = (cond_a > cond_b) ? cond_a : cond_b = %d", cond_result); // Expected: 15

        // Example 2: Nested Conditional Operation
        // cond_result = (cond_a > cond_b) ? cond_a : (cond_a < cond_b) ? cond_b : 32'd0;
        cond_result = (cond_a > cond_b) ? cond_a : (cond_a < cond_b) ? cond_b : 32'd0;
        $display("Nested conditional cond_result = %d", cond_result); // Expected: 15

        // Example 3: Handling unknown (x) and high- impedance (z) values
        cond_condition = 1'bx;
        cond_input_val = 32'd5;
        cond_result = cond_condition ? cond_input_val : 32'bz;
        $display("With cond_condition = x, cond_result = %h", cond_result); // Expected: cond_result = x(unknown)

        cond_condition = 1'bz;
        cond_result = cond_condition ? cond_input_val : 32'bz;
        $display("With cond_condition = z, cond_result = %h", cond_result); // Expected: cond_result = z (high-impedance)

        cond_condition = 1'b1;
        cond_result = cond_condition ? cond_input_val : 32'bz;
        $display("With cond_condition = 1, cond_result = %h", cond_result); // Expected: cond_result = 5, ignore 32'bz value
    end
`endif
`ifdef CONCATENATION_OPERATOR_TEST
    reg [31:0] concat_before;
    reg [63:0] concat_after;

    initial begin
        $display("Concatenation Operation Example");
        // Initialize the 'concat_before' variable with a samlpe 32-bit value
        concat_before = 32'h5A5A5A5A;

        // Perform the concatenation operation to interleave zeros between the bytes
        concat_after = {concat_before[31:24], 8'b0, concat_before[23:16], 8'b0, concat_before[15:0], 8'b0, concat_before[7:0], 8'b0};

        // Display the results
        $display("concat_before = %h", concat_before);
        $display("concat_after = %h", concat_after);    
    end
`endif
`ifdef REPLICATION_OPERATOR_TEST
    reg [2:0] repl_a;
    reg [1:0] repl_b;
    reg repl_c;
    reg [63:0] repl_result;

    initial begin
        $display("Replication Operation Example");
        // Example: Replication to create a 32-bit value
        repl_result = {{16{1'b1}}, {16{1'b0}}}; // Creates 16 bits of '1' followed by 16 bits of '0'


        // Display the repl_result
        $display("repl_result = %b (binary), %h (hexadecimal)", repl_result, repl_result); // Expected: 32'hFF00;

        // (Quiz) !!
        // Initialize variables
        repl_a = 3'b100; // 3-bit value
        repl_b = 2'b01; // 2-bit value
        repl_c = 1'b1; // 1-bit value

        // Perform concatention and replication operation
        repl_result = {repl_a, {3{repl_a, repl_b}}, {3'h5{repl_b, repl_c}}, 8'b0, 4'hA};

        // Display the repl_result
        $display("repl_result = %b (binary), %h (hexadecimal)", repl_result, repl_result);
    end
`endif
`ifdef EVENT_OPERATOR_TEST // Need to understand Timing!!
    reg evt_clk;
    initial begin
        $display("Event Operation Example");
        // Initial signals
        evt_clk = 0;

        @(posedge evt_clk) // Trigger when either goes high
        $display("How to set value 1 ??!!");
        #100
        // End the simulation
        $finish;
    end
`endif
endmodule