module operand_tb;
    //Declare variable and nets
    reg [31:0] little_end_vector; // little endian
    reg [0:31] big_end_vector; // big endian
    reg [63:0] dword;
    reg [7:0] byte_output;
    reg [7:0] jhpark_8b_ram [0:255];
    reg [3:0] sel_val;
    reg [8*10-1:0] string_val1, string_val2;

    initial begin
        // Initialize vectors
        little_end_vector = 32'h12345678;  // Example 32-bit value with LSB first
        big_end_vector = 32'h87654321;
        dword = 64'hFEDCBA9876543210;

        // Display result
        $display("Little Endian Vector: %h", little_end_vector);
        $display("Big Endian Vector: %h", big_end_vector);

        // Example of part-sel_valect
        $display("Little Endian Vector [15:8]: %h", little_end_vector[15:8]); // sel_valect middle byte
        $display("Little Endian Vector [7:0]: %h", little_end_vector[7:0]);// sel_valect middle byte
        $display("Big Endian Vector [8:15]: %h", big_end_vector[8:15]);//sel_valect lower byte
        $display("Big Endian Vector [0:7]: %h", big_end_vector[0:7]);//sel_valect lower byte
        //$display("Big Endian vector [7:0]: %h", big_end_vector[7:0]); //(Syntax error) please keep the vector index order

        // Indexed part-sel_valect example for little_end_vector (SGDH Pick)
        $display("Little Endian Vector Indexed Part-sel_valect [0 +: 8]: %h", little_end_vector[15:8]); // [7:0]
        $display("Little Endian Vector Indexed Part-sel_valect [8 +: 8]: %h", little_end_vector[8 +:8]);// [15:8] with positive index
        $display("Little Endian Vector Indexed Part-sel_valect [15 -: 8]: %h", little_end_vector[15 -: 8]);// [15:8] with negative index

        // Indexed part-sel_valect example for big_end_vector
        $display("Big Endian Vector Indexed Part-sel_valect [0 +: 8]: %h", big_end_vector[0 +: 8]); //[0:7]
        $display("Big Endian Vector Indexed Part-sel_valect [8 +: 8]: %h", big_end_vector[8 +: 8]); //[8:15]
        $display("Big Endian Vector Indexed Part-sel_valect [15 -: 8]: %h", big_end_vector[15 -: 8]); // [8:15]

        // (Little endian) continue with test cases
        sel_val = 4'b0001;
        if (sel_val > 0 && sel_val < 8)
            byte_output = dword[8*sel_val+:8]; // sel_valectes 8-bit chunk based on sel_val [15:8]
        $display("sel_valected Byte from Dword: %h", byte_output);

        sel_val = 4'd7;
        if(sel_val > 0 && sel_val < 8)
            byte_output = dword[8*sel_val+:8]; //sel_valects 8-bit chunk based on sel_val [63:56]
        $display("sel_valected Byte from Dword: %h", byte_output);

        // Array memory addressing example
        jhpark_8b_ram[10] = 8'hAA; //Example memory initialization
        jhpark_8b_ram[20] = jhpark_8b_ram[10]; //Example of copying memory content
        $display("Memory [20]: %h", jhpark_8b_ram[20]);

        // Check string concatenation and comparison
        {string_val1} = "Hello";
        {string_val2} = "World!";

        $display("Concatenation Result: %h", {string_val1, string_val2});
        $display("Concatenation Result: %h", {"Hello", "World!"});
        if ({string_val1, string_val2} == {"Hello", "World!"})
            $display("same words");
        else
            $display("Different words");
    end
endmodule