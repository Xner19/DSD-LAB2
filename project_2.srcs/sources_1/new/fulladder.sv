`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2024 03:53:19 PM
// Design Name: 
// Module Name: fulladder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module halfadder (
    output s, 
    output c, 
    input a, 
    input b
);

    xor (s, a, b);  // XOR for sum
    and (c, a, b);  // AND for carry

endmodule

module fulladder(
input c1,
input x,
input y,
output sout,
output cout

    );
   logic s1;
   logic c2; 
   logic c3;
halfadder H1(s1,c2,x,y);
halfadder H2(sout,c3,c1,s1);
or (cout,c3,c2);

endmodule
module fulladder_fourbit(
input cin,
input A1, A2 ,A3 ,A0,
input B0,B1,B2,B3,
output cout,
output S0,S1,S2,S3);
   logic c0;
   logic c1; 
   logic c2;
fulladder H1(cin,A0,B0,S0,c0);
fulladder H2(c0,A1,B1,S1,c1);
fulladder H3(c1,A2,B2,S2,c2);
fulladder H4(c2,A3,B3,S3,cout);
endmodule
