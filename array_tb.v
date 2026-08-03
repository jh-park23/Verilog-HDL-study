module array_tb;
    reg scalar_array [11:0];
    reg concat_scalar_array [11:0];
    reg [11:0] vector;
    reg [31:0] vector_reg_array [127:0];
    integer i; //using for loop

    initial begin
       //Assign values to scalar array
       scalar_array[11] = 1'b1;
       scalar_array[10] = 1'b0;
       scalar_array[9] = 1'b1;
       scalar_array[8] = 1'b0;
       scalar_array[7] = 1'b1;
       scalar_array[6] = 1'b0;
       scalar_array[5] = 1'b1;
       scalar_array[4] = 1'b0;
       scalar_array[3] = 1'b1;
       scalar_array[2] = 1'b0;
       scalar_array[1] = 1'b1;
       scalar_array[0] = 1'b0;

       // using concatenate operation
       {
        concat_scalar_array[11],
        concat_scalar_array[10],
        concat_scalar_array[9],
        concat_scalar_array[8],
        concat_scalar_array[7],
        concat_scalar_array[6],
        concat_scalar_array[5],
        concat_scalar_array[4],
        concat_scalar_array[3],
        concat_scalar_array[2],
        concat_scalar_array[1],
        concat_scalar_array[0] } = {1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0};
        vector = {1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0}; 
        for (i=0; i<12; i = i+1) begin
            if(scalar_array[i] == concat_scalar_array[i]) begin
                $display("scalar_array[%0d] = %b, concat_scalar_array[%0d] = %b", i, scalar_array[i], i, concat_scalar_array[i]);
            end else begin
                $display("(Mismatch) scalar_array[%0d]= %b, concat_scalar_array[%0d] = %b", i, scalar_array[i], i, concat_scalar_array[i]);
            end
            if(concat_scalar_array[i] == vector[i]) begin
                $display("concat_scalar_array[%0d] = %b, vector[%0d] = %b", i, concat_scalar_array[i], i, vector[i]);
            end else begin
                $display("(Mismatch) concat_scalar_array[%0d] = %b, vector[%0d] = %b", i, concat_scalar_array[i], i, vector[i]);
            end
        end

        //Assign values to vector to register array
        vector_reg_array[0] = 32'hAAAAAAAA;
        vector_reg_array[1] = 32'h55555555;

        $display("scalar_array[0] = %b, vector_reg_array[0] = %h, vector_reg_array[1] = %h", scalar_array[0], vector_reg_array[0], vector_reg_array[1]);
        //$display("scalar_array = %b", scalar_array); // error, because of scalar array is unpacked type.
        $display("vector[0] = %b", vector[0]);
        $display("vector = %b", vector);
    end
endmodule