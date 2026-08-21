// Reset all previous compile directives to default values
`resetall

// Include basic definitions and timescale
`include "common_defines.vh"

`ifdef FIXED_8B_COUNTER
module sgdh_counter (
    input wire clk,
    input wire reset,
    output wire [7:0] out
);
    //INclude function definitions
    `include "functions.vh"
    reg [7:0] counter;

    //sequential logic to increment the counter
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 8'b0;
        end else begin
            counter <= increment(counter); // Using the included function  
        end
    end 
    
    //Assign the counter value to the output
    assign out = counter;
endmodule
`elsif DEFINE_COUNTER
module sgdh_counter (
    input wire clk,
    input wire reset,
    output wire [`WIDTH-1:0] out
);
    // Include function definictions
    `include "functions.vh"
    reg [`WIDTH-1:0] counter;

    // Sequential logic to increment the counter
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= {`WIDTH{1'b0}};
        end else begin
            counter <= increment(counter); //Using the include function
        end
    end

    // Assign the counter value to the output
    assign out = counter;
endmodule
`elsif PARAMETER_COUNTER // sgdh pick
module sgdh_counter #(parameter WIDTH = 8) (
    input wire clk,
    input wire reset,
    output wire [WIDTH-1:0] out
);
    // Include function definitions
    `include "functions.vh"
    reg [WIDTH-1:0] counter;

    //Sequential logic to increment the counter
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= {WIDTH{1'b0}};
        end else begin
            counter <= increment(counter); //Using the include function
        end
    end

    // Assign the counter value to the output
    assign out = counter;
endmodule
`else
// Nomodule.. Syntax Error
`endif
// Undefine macros using include
`include "common_undefines.vh"