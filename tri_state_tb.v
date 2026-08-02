module tri_state_tb;
    reg control; // control signal
    tri data; // Tri-state signal line
    reg data_out1, data_out2; // Two driver outputs

    // Driver1
    assign data = (control == 1'b0) ? data_out1 : 1'bZ;
    
    // Driver2
    assign data = (control == 1'b1) ? data_out2 : 1'bZ;

    initial begin
        // Monitor values continuously
        $monitor("Time: %0t | control: %b | data: %b", $time, control, data);
        // Initial settings
        data_out1 = 1'b0;
        data_out2 = 1'b1;
        control = 1'b0;
        #10 control = 1'b1;
    end
endmodule