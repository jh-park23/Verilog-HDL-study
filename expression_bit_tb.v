module expression_bit_tb;

    //declare the registers and variables for the test
    reg [15:0] opA, opB;
    reg [16:0] resultA;
    reg [15:0] resultB;
    reg [15:0] a, b, c;
    reg [16:0] sum;
    reg [3:0] x; //4-bit variable for base
    reg [5:0] y; // 6-bit variable for exponent
    reg [39:0] z; // 40-bit result storage

    initial begin
        // Initialize the operands
        opA = 16'hFFFF; //Maximum 16-bit value
        opB = 16'h0001; //Minimum non-zero value

        // Test overflow with addition
        resultA = opA + opB; //Should result in overflow, expect 17-bit result
        resultB = opA + opB;// NO overflow handling, expect 16-bit result

        $display("ResultA (17-bit): %h", resultA); //Expect: 00010000
        $display("ResultB (16-bit): %h", resultB); //Expect: 0000 (overflowed)

        //Initialize the operands
        a = 16'hFFFF; // Example value
        b = 16'h0001; // Example value
        //wrong Example: Adding a and b and then shifting right by 1 bit
        c=(a+b) >> 1; // The result may not be as expected due to insufficient bit-width
        // Display result
        $display("c = (a+b) >> 1: %h", c); // Check the value of c

        //Right Example: Use a larger bit-width for the sum to avoid overflow
        sum = a + b;
        c = sum >> 1; // Now shifting after ensuring the correct bit-width for sum
        // Display result
        $display("sum a + b: %h", sum); // display the sum
        $display("c = sum >> 1: %h", c); // check the value of c after shift

        //Right Example: Adding a constant 17'b0 to the sum
        c = (a + b +17'b0) >> 1; // Ensuring the expressin considers a 17-bit constant
        // Display result
        $display("c = (a + b + 17'b0) >> 1: %h", c); //check the value of c after shift

        // (Power) Initialize the operands
        x = 4'hF; // Assign 15 to x
        y = 6'hA; // Assign 10 to y

        // First case: Direct power operation (a**b) and using only a's bit width
        $display("x ** y = %h", x ** y); // This will likely overflow and produce a small number

        // Second case: Concatenate operation, limited to 4-bit result
        z = {x ** y};
        $display("Concatenated z = %h", z); //only 4 bits will be used in the result

        // Third case: Direct assignment to 40-bit register (z)
        z = x **y;
        $display("Full 40-bit z = %h", z); // This should store the full 40-bit result
        
    end
endmodule