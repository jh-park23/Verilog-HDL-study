//`define CONTENTS_1 // lexical Token, White Space, Comment
//`define CONTENTS_2 //Numbers
//`define CONTENTS_3 // signed, 2's Complement
`define CONTENTS_4 // Real, String, Conversion

module lexical_convention_test_tb;
`ifdef CONTENTS_1
    reg in0, in1; // input signals
    wire [1:0] out; // output signal

    //Instantiate the module under test (UUT)
    lexical_convention_test uut (
        .in0(in0),
        .in1(in1),
        .out(out)
    );

    // Initial block for the Testbench
    initial begin
        //test case 1: in0=0, in1=0
        in0=0; in1=0;
        #10; // wait for 10 time units
        $display("Test Case 1: in0 = %b, in1 =%b, out = %b", in0, in1, out);
    
        // Initial case 2: in0=0 in1=1
        in0=0; in1=1;
        #10; // wait for time units
        $display("Test case 2: in0 = %b, in1 = %b, out = %b", in0, in1, out);

        //test case 3: in0=1, in1=0
        in0=1; in1=0;
        #10; //wait for time units
        $display("Test case 3: in0= %b, in1 = %b, out = %b", in0, in1, out);

        //test case 4: in0=1, in1=1
        in0=1; in1=1;
        #10; // wait for time units
        $display("Test case 4: in0 = %b, in1= %b, out = %b", in0, in0, out);
    end
`endif

`ifdef CONTENTS_2
    initial begin
        $display("[contest - 2] Number Example");
        // Decimal
        $display("Decimal: 1'd0 = %d, 8'd33 = %d, 16'd718 = %d, 32'd718 = %d", 1'd0, 8'd33, 16'd718, 32'd718);
        //Binary
        $display("Binary: 1'b0 = %b, 8'b10000000 =%b, 12'b0000_1000_0000 = %b", 1'b0, 8'b10000000, 12'b0000_1000_0000);
        // Octal and Hexadecimal
        $display("Octal: 3'o7 = %o, 12'o1316 = %o", 3'o7, 12'o1316);
        $display("Hexadecimal: 12'h080 = %h, 8'h80 = %h", 12'h080, 8'h80);
    end
`endif

`ifdef CONTENTS_3
    initial begin
        //signed Number Examples
        $display("[Contents - 3] Signed, 2's Complement Example");
        //Negative Decimal
        $display("Negative Decimal: -4'10 = %d", -5'sd10);
        // Signed Hexadecimal
        $display("Signed Hexadecimal: 4'shf = %d", 4'shf);
        // Negative Signed Decimal
        $display("Negative Signed Decimal: -4'sd15 = %d", -4'sd15);
    end
`endif

`ifdef CONTENTS_4
    //Real Number
    real r1, r2;
    initial begin
        $display("[Contents - 4] Real, String, Conversion Example");
        r1 = 1.2;
        r2 = 1.30e-2;
        $display("Real: r1 = %f, r2 = %f", r1, r2);
    end

    // String Example
    reg [8*14:1] stringvar;
    initial begin
        stringvar = "hello world";
        $display("%s is stored as %h", stringvar, stringvar);
        stringvar = {stringvar,"!!!"};
        $display("%s is stored as %h", stringvar, stringvar);
        stringvar = {stringvar,"!!!", "1234"};
        $display("%s is stored as %h", stringvar, stringvar);
    end

    //Compiler directive example
    `define EXAMPLE 42
    initial begin
        $display("Compiler directive example: `EXAMPLE = %d", `EXAMPLE);
    end
`endif 
endmodule