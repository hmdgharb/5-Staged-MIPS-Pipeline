module DataMemory#(parameter SIZE = 256)(
  input MemWriteEn,
  input reset,
  input [15:0] address,
  input [15:0] writeData,
  output [15:0] ReadData
);

  reg [15:0]datamem[0:SIZE-1] ;
 
  always@(posedge reset, MemWriteEn)begin
    
    if(reset)
          $readmemb("data.dat", datamem);
 
    else if(MemWriteEn == 1'b1)begin
      
      datamem[address] = writeData[15:0];
      $writememb("data.dat", datamem );
      end
  end
 
  assign ReadData = datamem[address];
 endmodule
