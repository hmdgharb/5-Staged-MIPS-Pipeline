module MUX2#(parameter SIZE = 4)(input SLCT,input[SIZE - 1:0] IN1, IN0, output[SIZE - 1:0] OT);
  
  assign OT = (SLCT)?IN1:IN0;  
endmodule