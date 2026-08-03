`default_nettype  // turn off implicit dada types

module implicit_tb (
    input wire a, b, ci,
    output wire sum, co
);
wire n1, n2, n3;

xor g1 (n1, a, b);
xor g2 (sum, nl, ci); // EPPOR! nl is not declared
and g3 (n2, a, b, c); //ERROR! c is not declared
and g4 (n3, n1, ci);
or g5 (co, n2, n3);

endmodule

`default_nettype wire // turn implicit nets on again to avoid side-effects