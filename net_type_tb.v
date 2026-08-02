module net_type_tb;
    // no assign suppy 0,1
    assign su0 = 1;
    assign su1 = 0;

    wand wa;
    wor wo;

    //multiple assign is possible, but SGDH recommands using wire
    assign wa = 1'b1;
    assign wa = 1'b0;
    assign wo = 1'b1;
    assign wo = 1'b0;

    wire wa_wire = 1'b1 & 1'b0; //SGDH Recommanded
    wire wo_wire = 1'b1 | 1'b0;

    initial begin
        $display("su0 = %b", su0);
        $display("su1 = %b", su1);
        $display("wa = %b", wa);
        $display("wo = %b", wo);
        $display("wa_wire = %b", wa_wire);
        $display("wo_wire = %b", wo_wire);
    end
endmodule