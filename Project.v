module Project(
      input clock,
      input reset
  );

  wire  [15:0] IF_Output;
  wire  [7:0]   PC_Out;
  wire  [15:0] ID_Input;
  
  wire  [15:0] ID_Alusrc1;
  wire  [15:0] ID_Alusrc2;
  wire  [15:0] ID_Memwritedata;
  wire  [3:0] ID_Alucmd;
  wire  [2:0] ID_Rfwritebackdest;
  
  wire IDJump;
  wire IDBranch;
  wire IDMemwriteenable;   
  wire IDWritebackenable;
  wire IDWritebackresultmux;  
  
  wire  [57:0]  EX_Input;
  wire  [37:0]  MEM_Input;  
  wire  [15:0]  EX_Lowresult;
  wire  [36:0]  WB_Input;

  wire  [15:0]  MEM_Memoryout;  
  
  wire  WBWriteenable;
  wire  [2:0] WBWritedest;
  wire  [15:0] WBWritedata;
  
  wire  stall;
  wire  [2:0] IDop1;
  wire  [2:0] IDop2;
  wire  zero;
    
  IF_STAGE Inst_Fetch(
    .clk(clock),
    .rst(reset),
    .instr_fetch_enable(stall),
    .imm_branch_offset(ID_Input[5:0]),
    .branch_enable(IDBranch),
    .jump(IDJump),
    .pc(PC_Out),
    .instr(IF_Output)
    );

  IF_ID IF_ID_Register(
    .clock(clock),
    .reset(reset),
    .In(IF_Output),
    .InEnable(stall),
    .Out(ID_Input)
    
      );


  ID_STAGE Inst_Decode(
    .clk(clock),
    .rst(reset),
    .ID_Zero(zero),
    .ID_RegWriteEn(WBWriteenable),
    .ID_RegWriteDest(WBWritedest),
    .ID_RegWriteData(WBWritedata),
    .ID_In(ID_Input),
    .ID_Controller(IF_Output),
    .ID_AluSrc1(ID_Alusrc1),
    .ID_AluSrc2(ID_Alusrc2),
    .ID_MemWriteData(ID_Memwritedata),
    .ID_RFWriteBackDest(ID_Rfwritebackdest),
    .ID_MemWriteEn(IDMemwriteenable),
    .ID_WriteBackResultMux(IDWritebackresultmux),
    .ID_RFWriteBackEn(IDWritebackenable),
    .ID_ALUCmd(ID_Alucmd),
    .ID_jump(IDJump),
    .ID_branch(IDBranch),
    .ID_op1(IDop1),
    .ID_op2(IDop2)
  );

  ID_EX   ID_EX_Register(
    .clock(clock),
    .reset(reset),
    .ex_alu_cmd(ID_Alucmd),
    .ex_alu_src1(ID_Alusrc1),
    .ex_alu_src2(ID_Alusrc2),
    .mem_write_en(IDMemwriteenable),
    .mem_write_data(ID_Memwritedata),
    .write_back_en(IDWritebackenable),
    .write_back_dest(ID_Rfwritebackdest),
    .write_back_result_mux(IDWritebackresultmux),
    .stall(stall),
    .RegIDToExOut(EX_Input)
  );

  EX_STAGE  Inst_Execute(
    .EX_AluCmd(EX_Input[57:54]),
    .EX_AluSrc1(EX_Input[53:38]),
    .EX_AluSrc2(EX_Input[37:22]),
    .zeroFlag(zero),
    .EX_LowResult(EX_Lowresult)
  );

  EX_MEM  EX_MEM_Register(
    .clock(clock),
    .reset(reset),
    .ex_alu_result(EX_Lowresult),
    .mem_write_en(EX_Input[21:21]),
    .mem_write_data(EX_Input[20:5]),
    .write_back_en(EX_Input[4:4]),
    .write_back_dest(EX_Input[3:1]),
    .write_back_result_mux(EX_Input[0:0]),
    .RegExToMemOut(MEM_Input)
  );
  
  MEM_STAGE Inst_Memory(
    .rst(reset),
    .DataMemoryAddress(MEM_Input[37:22]),
    .DataMemoryWriteData(MEM_Input[20:5]),
    .DataMemoryWriteEnable(MEM_Input[21:21]),
    .DataMemoryOut(MEM_Memoryout)
  );
  
  MEM_WB MEM_WB_Register(
    .clock(clock),
    .reset(reset),
    .ex_alu_result(MEM_Input[37:22]),
    .mem_read_data(MEM_Memoryout),
    .write_back_en(MEM_Input[4:4]),
    .write_back_dest(MEM_Input[3:1]),
    .write_back_result_mux(MEM_Input[0:0]),
    .RegMemToWBOut(WB_Input)
  );
  
  WB_STAGE Inst_WriteBack(
    .pipeline_reg_in(WB_Input),
    .Reg_write_en(WBWriteenable),
    .Reg_write_dest(WBWritedest),
    .Reg_write_data(WBWritedata)
  );

  HAZARD myHazard(
  .clk(clock),
  .rst(reset),
  .decoding_op_src1(IDop1),
  .decoding_op_src2(IDop2),
  .decoding_op_dest(ID_Input[11:9]),
  .ex_op_dest(EX_Input[3:1]),
  .mem_op_dest(MEM_Input[3:1]),
  .wb_op_dest(WBWritedest),
  .pipeline_stall_n(stall)
);
endmodule