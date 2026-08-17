module mux2to1 #(parameter WIDTH = 8) (
    output reg [WIDTH-1:0] out,
    input [WIDTH-1:0] a, b,
    input sel
);
begin 
    always @(a or b or sel) begin
        if(sel == 0) begin
            out = a;
        end else begin
            out = b;
        end
    end
end
endmodule 