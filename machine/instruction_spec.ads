generic
   Max_Reg : Positive;
   Max_Mem : Natural;

package Instruction_Spec is

   type Register is new Positive range 1 .. Max_Reg;
   type Mem_Id is new Natural range 0..Max_Mem;

   type Instr_Kind is 
     (Instr_Load,
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
      Instr_Halt);

   type Max_Args is new  Natural range 0 .. 2;
   
   type Instr_Arg_Num is array(Max_Args) of Integer;

   type Instr is
      record
	 Instruction : Instr_Kind;
	 Nargs : Max_Args;
	 Args : Instr_Arg_Num;
      end record;
   
   function Make_Labeled_Instr (L : in Natural; I : in Instr_Kind; N : Max_Args ; A : Instr_Arg_Num) return Instr;
   function Make_Instr ( I : in Instr_Kind; N : Max_Args ; A : Instr_Arg_Num) return Instr;
   
   type Compiled_Program  is array (Natural range <>) of Instr;
   
   function Mk_Instr_Load(R1,R2,R3 : in Register ) return Instr;
   function Mk_Instr_Loadn(R1,R2,R3 : in ,
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
