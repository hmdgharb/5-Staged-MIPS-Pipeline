module SixToSixteen(input [5:0] In, output [15:0] Out);
  
  assign Out = { 10'b0, In};
endmodule