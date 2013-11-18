package body Instruction_Spec is

   function Make_Instr ( I : in Instr_Kind; N : Max_Args ; A : Instr_Arg_Num) return Instr is
      Ni : Instr;
   begin
      Ni.Instruction := I;
      Ni.Nargs := N;
      Ni.Args := A;
      return Ni;
   end Make_Instr;

   function Make_Labeled_Instr (L : in Natural; I : in Instr_Kind; N : Max_Args ; A : Instr_Arg_Num) return Instr is
      Ni : Instr;
   begin
      Ni := Make_Instr (I, N, A);
      Ni.Label := L;
      return Ni;
   end Make_Labeled_Instr;

   Instr_Load,
      Instr_Loadn,
      Instr_Loadi,
      Instr_Store,
      Instr_Storer,
      Instr_Storei,
      Instr_Add,
      Instr_Sub,
      Instr_Mul,
      Instr_Div,
      Instr_Mod,
      Instr_Zero,
      Instr_Inc,
      Instr_Dec,
      Instr_Jump,
      Instr_Jzero,
      Instr_Jpos,
      Instr_Jneg,
      Instr_Jnzero,
      Instr_Jsr,
      Instr_Rtn,
      Instr_Push,
      Instr_Pop,
      Instr_Halt

end Instruction_Spec;
