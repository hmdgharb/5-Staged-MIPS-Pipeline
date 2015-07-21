module InstructionMemory#(parameter SIZE = 256)(input reset, input [7:0] addr, output reg[15:0] inst);
  
  reg[15:0]instmem[0:SIZE - 1];
  
  always@(*)begin
      if(reset == 1)
        //$readmemb("addi.prog", instmem);
        //$readmemb("addi_2.prog", instmem);
        //$readmemb("add.prog", instmem);
        $readmemb("store_load.prog", instmem);
      else
          inst = instmem[addr];
  end
endmodule