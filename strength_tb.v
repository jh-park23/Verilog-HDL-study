module strength_tb();
    wire anet;
    wire bnet;
    wire cnet;
    wire dnet;
    wire enet;

    wire data0 = 0;
    wire data1 = 1;

    assign                  anet = data0;
    assign                  anet = data1;

    assign                  bnet = data0;
    assign                  bnet = data1;

    assign                  cnet = data0;
    assign                  cnet = data1;

    assign (strong1, weak0) dnet = data0;
    assign (strong1, weak0) dnet = data1;

    assign (strong0, weak1) enet = data0;
    assign (strong0, weak1) enet = data1;

    initial begin
        $display("data0 is %b", data0);
        $display("data1 is %b", data1);
        $display("anet is %b", anet);
        $display("bnet is %b", bnet);
        $display("cnet is %b", cnet);
        $display("dnet is %b", dnet);
        $display("enet is %b", enet);
    end
endmodule

`ifdef TRIREG_EXAMPLE // DO not use in xsim. Test in vcs is ok.
module strength_tb;

    //Declare trireg nets with specified decay strengths
    trireg (small) wire_small; // wire with small decay strength
    trireg (medium) wire_medium; // wire with medium decay strength
    trireg (large) wire_large; // wire with large decay strength

    //Declare control and data signals
    reg control;
    reg data;

    // Assign data signal to wires based on control signal
    assign wire_small = (control) ? data : 1'bZ;
    assign wire_medium = (control) ? data : 1'bZ;
    assign wire_large = (control) ? data : 1'bZ;

    initial begin
        //set initial values
        control = 1;
        data = 1;
        #10 control = 0; // set control to 0 to put wires in high impedance state

        // Change data signal after a delay
        #20 data = 0;
        #10 control =1; // Set control to 1 to drive data signal onto wires again

        #10 $finish; // End the simulation
    end
    
    // Monitor the values of control, data, and wires over time
    initial begin
        $monitor("Time=%0t | Control=%b | Data=%b | wire_small=%b | wire_medium=%b | wire_large=%b",
                 $time, control, data, wire_small, wire_medium, wire_large);
    end
endmodule
`endif