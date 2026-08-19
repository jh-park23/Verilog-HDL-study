module macro_function_tb;

    //Correct macro definitions
    `define max(a,b) ((a) > (b) ? (a) : (b) )
    // (multi-line definition)
    `define multiplier(a,b) \
                         ((a) * (b))

    integer p, q, r, s, n;
    initial begin
        // Assign some values to p, q, r, s
        p = 3;
        q = 4;
        r = 2;
        s = 5;

        // Test the `max ` macro
        n = `max(p+q+1, r+s);
        $display("Result of `max(p+q+1, r+s)`: %d", n); // Expected: 8 (p+q+1 = 8, r+s = 7, result = 8)

        // Test the correct `multiplier` macro
        n = `multiplier(p+q, r+s);
        $display("Result of `multiplier(p+q, r+s)`: %d",n);  // Expected: 49 (7*7)

        // Demonstrate the incorrect useage without parentheses
        `define wrong_multiplier(a,b) a * b

        n = `wrong_multiplier(p+q, r+s);
        $display("Result of `wrong_multiplier(p+q, r+s)`: %d", n); // Expected: Incorrect result due to macro expansion
    end
endmodule