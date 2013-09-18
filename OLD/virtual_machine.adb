package body Virtual_Machine is

   procedure State_Init_Regs (S : in out State) is
   begin
      for I in Integer range 0 .. Integer(Register'Last) loop
	 S.Regs (I) := 0;
      end loop;
      end State_Init_Regs;

   procedure State_Init_Memory (S : in out State) is
   begin
      for I in Integer range 0 .. 255 loop
	 S.Ram (I) := 0;
      end loop;
   end State_Init_Memory;

   procedure State_Init_Stack (S : in out State) is
   begin
      S.Exec_Stack := New_Stack (100);
   end State_Init_Stack;


   function Init_Evaluation (Prog : in Compiled_Program) return Configuration is
      St : State;
      C : Configuration;
   begin
      St.Pc := 0;
      State_Init_Regs (St);
      State_Init_Memory (St);
      State_Init_Stack (St);
      -- Set state and program
      C.Current_State := St;
      C.Program := Prog;
      return C;
   end Init_Evaluation;

   function Arg_Vi ( C : in Instr ; N : in Max_Args ) return Integer is
   begin
      return C.Args (N);
   end Arg_Vi;


   procedure Eval_One_Step (Conf : in out Configuration) is

      Curr_Pc : Natural := Conf.Current_State.Pc;
      -- Current Program Counter

      X : Instr := Conf.Program (Curr_Pc) ;
      -- Instruction pointer by the Program Counter

      Curr_Regs : Registers := Conf.Current_State.Regs;
      Curr_Mem : Memory := Conf.Current_State.Ram;
      -- Current register and memory addressing

      Curr_Stack : Stack := Conf.Current_State.Exec_Stack;

      Step : Boolean := False ;
      -- Flag denoting if an increment on the counter is needed or not

   begin
      case X.Instruction is
      when Instr_Load =>
	 Curr_Regs (X.Args (1)) := Curr_Mem (X.Args (0));
	 Step := True;
      when Instr_Loadn =>
	 Curr_Regs (X.Args (1)) := X.Args (0);
	 Step := True;
      when Instr_Loadi =>
	 Curr_Regs (X.Args (1)) := Curr_Mem (Curr_Regs (X.Args (0)));
	 Step := True;
      when Instr_Store =>
	 Curr_Mem (Arg_Vi (X, 1)) := Curr_Regs (Arg_Vi (X, 0));
	 Step := True;
      when Instr_Storer =>
	 Curr_Regs (Arg_Vi (X, 1)) := Curr_Regs (Arg_Vi (X, 0));
	 Step := True;
      when Instr_Storei =>
	 Curr_Mem (Curr_Regs (X.Args (1))) := Curr_Regs (X.Args (0));
	 Step := True;
      when Instr_Add =>
	 Curr_Regs (X.Args (1)) := Curr_Regs (X.Args (1)) +  Curr_Regs (X.Args (0));
	 Step := True;
      when Instr_Sub =>
	 Curr_Regs (X.Args (1)) := Curr_Regs (X.Args (1)) -  Curr_Regs (X.Args (0));
	 Step := True;
      when Instr_Mul =>
	 Curr_Regs (X.Args (1)) := Curr_Regs (X.Args (1)) *  Curr_Regs (X.Args (0));
	 Step := True;
      when Instr_Div =>
	 if Curr_Regs (X.Args(0)) /= 0 then
	    Curr_Regs (X.Args (1)) := Curr_Regs (X.Args (1)) / Curr_Regs (X.Args (0));
	    Step := True;
	 end if;
      when Instr_Mod =>
	 if Curr_Regs (X.Args(0)) /= 0 then
	    Curr_Regs (X.Args (1)) := Curr_Regs (X.Args (1)) mod Curr_Regs (X.Args (0));
	    Step := True;
	 end if;
      when Instr_Zero =>
	 Curr_Regs (X.Args (0)) := 0;
	 Step := True;
      when Instr_Inc =>
	 Curr_Regs (X.Args (0)) := Curr_Regs (X.Args (0)) + 1;
	 Step := True;
      when Instr_Dec =>
	 Curr_Regs (X.Args (0)) := Curr_Regs (X.Args (0)) -1 ;
	 Step := True;
      when Instr_Jump =>
	 Curr_Pc := X.Args (0);
      when Instr_Jzero =>
	 if Curr_Regs (X.Args (0)) = 0 then
	    Curr_Pc := X.Args (1);
	 else
	    Step := True;
	 end if;
      when Instr_Jpos =>
	 if Curr_Regs (X.Args (0)) > 0 then
	    Curr_Pc := X.Args (1);
	 else
	    Step := True;
	 end if;
      when Instr_Jneg =>
	 if Curr_Regs (X.Args (0)) < 0 then
	    Curr_Pc := X.Args (1);
	 else
	    Step := True;
	 end if;
      when Instr_Jnzero =>
	 if Curr_Regs (X.Args (0)) /= 0 then
	    Curr_Pc := X.Args (1);
	 else
	    Step := True;
	 end if;
      when Instr_Jsr =>
	 Push (Curr_Pc, Curr_Stack);
	 Curr_Pc := X.Args(0);
      when Instr_Rtn =>
	 Curr_Pc := Pop(Curr_Stack);
	 null;
      when Instr_Push =>
	 Push(Curr_Regs(X.Args(0)),Curr_Stack);
	 Step := True;
      when Instr_Pop =>
	 Curr_Regs (X.Args (0)) := Pop (Curr_Stack);
	 Step := True;
      when Instr_Halt =>
	 null;
      when others => null;
      end case;
   end Eval_One_Step;

end Virtual_Machine;
