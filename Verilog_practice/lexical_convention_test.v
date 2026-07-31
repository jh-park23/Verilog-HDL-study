
module lexical_convention_test(
    input in0,
    input in1,
    output [1:0] out
);
    assign out={in1,in0};

    // comment Example
    // THis is a line comment
    // /*
    // This is a block comment
    // It can span multiple lines
    // */
    // // This is wrong example: nested block comment
    // /*
    // This is a block comment
    // It can /* span multiple */ lines
    // */
endmodule