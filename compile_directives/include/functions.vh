// functions.vh
`include "common_defines.vh"

`ifdef FIXED_8B_COUNTER
function [7:0] increment;
    input [7:0] value;
    begin
        increment = value +1;
    end
endfunction
`elsif DEFINE_COUNTER
//`include "common_defines.vh"
// Parameterized function definition
function [`WIDTH-1:0] increment;
    input [`WIDTH-1:0] value;
    begin
        increment = value + 1;
    end
endfunction
//`include "common_undefines.vh"
`else
// Parameterized function definition
function [WIDTH-1:0] increment;
    input [WIDTH-1:0] value;
    begin
        increment = value + 1;
    end
endfunction
`endif