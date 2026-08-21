`include "common_defines.vh"

module sgdh_counter_tb;
    // Declare testbench signals
    reg clk;
    reg reset;
    wire [`WIDTH-1:0] out;
// (defines VS parameter) If we want to design 10b width counter?
`ifndef PARAMETER_COUNTER
    // Instantiate the sgdh_counter
    sgdh_counter u_sgdh_counter_0 (
        .clk(clk),
        .reset(reset),
        .out(out)
    );
`else
    // Instantiate the sgdh_counter
    sgdh_counter #(.WIDTH(`WIDTH))
    u_sgdh_counter_1 (
        .clk(clk),
        .reset(reset),
        .out(out1)
    );
`endif

    // Clock generator
    always #5 clk = ~clk; // 100MHz clock

    // Initial setup
    initial begin
`ifdef FIXED_8B_COUNTER
        $display("FIXED_8B_COUNTER");
`elsif DEFINE_COUNTER
        $display("DEFINE_COUNTER");
`elsif PARAMETER_COUNTER
        $display("PARAMETER_COUNTER");
`endif
        // Initialize signals
        clk = 0;
        reset = 0;
        // Display header for clarity in the console output
        $display("Time\tReset\t Counter");
        $monitor("%g\t%b\t%d", $time, reset, out);

        // Test scenario
        #10 reset = 1; // Activate reset signal
        #10 reset = 0; // Deactivate reset signal

        #100;  // Run simulation for 100ns

        $stop; // End simulation
    end
endmodule