module EX_STAGE(
  input [3:0]       EX_AluCmd,
  input [15:0]      EX_AluSrc1,
  input [15:0]      EX_AluSrc2,
  output            zeroFlag,
  output  [15:0]    EX_LowResult
);

  ALU myAlu(
   .a(EX_AluSrc1),
   .b(EX_AluSrc2),
   .cmd(EX_AluCmd),
   .rLeft(),
   .rRight(EX_LowResult),
   .zero(zeroFlag)
  );

endmodule                