with Global_Types; use Global_Types;

generic
   type Abs_Sy is private;

 package FOL_Terms is

   type Fol_Term_Kind is (Fol_Const_Tag, Fol_Func_Tag, Fol_Var_Tag);

   type Fol_Term is private;

   type Fol_Term_Access is access all Fol_Term;

private

   type Fol_Term_Discr (T : Fol_Term_Kind) is
      record
	 case T is
	 when Fol_Const_Tag =>
	    Fol_Const_Id : Abs_Sy;
	 when Fol_Func_Tag =>
	    Fol_Func_Id   : Abs_Sy;
	    Fol_Func_Arity : Pos_Natural ;
	 when Fol_Var_Tag =>
	    Fol_Var_Id     : Abs_Sy;
	 end case;
      end record;

   type Fol_Term_Discr_Access is access all Fol_Term_Discr;

   type Fol_Term is
      record
	 Fol_Term_Val : Fol_Term_Discr_Access;
      end record;

end FOL_Terms;
