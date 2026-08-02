module four_state_tb;
    reg a;
    initial begin
       a = 1'b0;
       $display("a = %b", a); //Display a=0
       a = 1'b1;
       $display("a = %b", a); //Display a=1
       a = 1'bX;
       $display("a = %b", a); //Display a=X
       a = 1'bZ;
       $display("a = %b", a); //Display a=Z
    end
endmodule