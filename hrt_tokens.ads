package hrt_tokens is

   type Token is
     (
      ----------------------
      -- Types and values --
      ----------------------
      Type_Nat_Tok,Type_Bool_Tok,Type_Float_Tok,Type_String_Tok,
      Value_Bool_Tok,Value_Float_Tok,Value_String_Tok,Value_Nat_Tok,Value_Int_Tok,
      --------------------------------------
      -- Binary and unary operator tokens --
      --------------------------------------
      Add_Tok,Sub_Tok,Mul_Tok,Div_Tok,
      ---------------------------
      -- Comparison operations --
      ---------------------------
      Eq_Tok,Neq_Tok,Lt_Tok,Gt_Tok,Le_Tok,Ge_Tok,
      Land_Tok,Lor_Tok,Limp_Tok,Lequi_Tok,Forall_Tok,Ex_Tok,
      -------------------------
      -- Sequential commands --
      -------------------------
      Assgn_Tok, -- Assignment
      Seq_Tok, -- Statement composition
      Null_Tok, -- null statement
      If_Tok,Then_Tok,Elif_Tok,Else_Tok,Fi_Tok, -- Conditional expressions
      While_Tok,Do_Tok,Variant_Tok,Done_Tok, -- Finite loops
      ---------------------------
      -- Formal specifications --
      ---------------------------
      Inv_Spec_Tok,Assrt_Spec_Tok,Pre_Tok,Post_Tok,Guarantee_Tok, -- Static assertions
      Dyn_Inv_Spec_Tok,Dyn_Assrt_Spec_Tok,Dyn_Pre_Tok,Dyn_Post_Tok,Dyn_Guarantee_Tok, -- Dynamic assertions
      Sch_Alg_Tok,Time_Unit_Tok,Deadline_Tok,Period_Tok,
      ---------------------------
      -- Structural constructs --
      ---------------------------
      System_Tok,Component_Tok,Task_Tok,Function_Tok,Procedure_Tok, -- Main constructs
      With_Tok,Begin_Tok,End_Tok,Vars_Block_Tok,Operations_Block_Tok,Specs_Block_Tok, -- Sections and blocks
      Param_In_Tok,Param_Out_Tok,Return_Tok,
      -------------------------
      -- Notification tokens --
      -------------------------
      End_Of_File_Tok,Error_Tok
     );

end hrt_tokens;
