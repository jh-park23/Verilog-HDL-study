//`define VERILOG_2001_MODULE
`timescale 1ns/1ps

//Text Marco Name Space
`define candy 1

`ifdef VERILOG_2001_MODULE
// MODULE definition using a namespace
module candy( // Module Name Space
    output candy // Port Name Space
// input candy // build error. duplicate port name
);
    reg candy; // Module Name Space
    // IT is illegal to redeclare any ports of the module in the body
`else

module candy(candy); // Verilog 95
    output candy; // Port Name Space
    reg candy; // Module Name Space
`endif

    begin // Block Name Space
        reg candy;
    end

    initial begin
        (* candy = "Attribute Candy" *) // Attribute Name Space
        $display("Attribute 'candy' used.");
    end

    initial begin
        candy = `candy; // Referring to the macro 'candy'
        $display("candy = %d", candy);
    end
endmodule

// Testbench module to simulate
module name_space_tb;
    wire candy; // Testbench definition for 'candy'

    //Instantiate the 'candy' module
    candy uut (
        .candy(candy) // Connect testbench candy to module candy input
    );
endmodule
