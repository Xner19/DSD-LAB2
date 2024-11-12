module tb_fulladder;
   logic cin, A0, A1, A2, A3, B0, B1, B2, B3;
   logic cout, S0, S1, S2, S3;

   // Instantiate the 4-bit full adder module
   fulladder_fourbit dut (
      .cin(cin), .A0(A0), .A1(A1), .A2(A2), .A3(A3), 
      .B0(B0), .B1(B1), .B2(B2), .B3(B3), 
      .cout(cout), .S0(S0), .S1(S1), .S2(S2), .S3(S3)
   );

   initial begin
      // Initialize inputs
      cin = 0;
      A0 = 0; A1 = 0; A2 = 0; A3 = 0;
      B0 = 0; B1 = 0; B2 = 0; B3 = 0;

      // Apply test vectors
      #10; {cin, A3, A2, A1, A0} = 5'b00001; {B3, B2, B1, B0} = 4'b0001; // 1 + 1
      #10; {cin, A3, A2, A1, A0} = 5'b00010; {B3, B2, B1, B0} = 4'b0011; // 2 + 3
      #10; {cin, A3, A2, A1, A0} = 5'b00011; {B3, B2, B1, B0} = 4'b0101; // 3 + 5
      #10; {cin, A3, A2, A1, A0} = 5'b00101; {B3, B2, B1, B0} = 4'b0110; // 5 + 6
      #10; {cin, A3, A2, A1, A0} = 5'b01000; {B3, B2, B1, B0} = 4'b1111; // 8 + 15

      // Complete the simulation
      #10;
      $stop;
   end

   initial begin
      // Monitor outputs to verify results
      $monitor("Time: %0t | A = %b%b%b%b | B = %b%b%b%b | cin = %b | Sum = %b%b%b%b | cout = %b", 
               $time, A3, A2, A1, A0, B3, B2, B1, B0, cin, S3, S2, S1, S0, cout);
   end

endmodule
