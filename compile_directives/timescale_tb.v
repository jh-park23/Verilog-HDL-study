`timescale 10ns/1ns
module timescale_tb;
    reg set;
    parameter d = 1.55; // 1.55 * 10ns =15.5ns -> 16ns
    initial begin
        #d set = 0; $display($realtime);
        #d set = 1; $display($realtime);
    end
endmodule