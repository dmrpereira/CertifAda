with Ada.Text_IO; use Ada.Text_IO;
with Linked_List_Spec;

package Fol_Spec is
   
   type Fol_Term_Kind is (Fol_Const,Fol_Func,Fol_Var);
   type Fol_Kind is (Fol_Imp,Fol_Pred,Fol_Forall,Fol_Neg);
   
   type Fol_Term is private;
   type Fol_Formula is private;
   
   function Build_Fol_Term_Var( X : in Natural) return Fol_Term;
   function Is_Fol_Term_Var( X : in Fol_Term ) return Boolean;
   function Unify_Fol_Term_Var( X , Y : in Fol_Term ) return Boolean;
   
   
   
   --procedure Show( R:in Fol_Term );
   -- procedure Show( R:in Fol_Formula );
   
private
   
   type Fol_Term_Node( N : Fol_Term_Kind );
   type Fol_Term is access all Fol_Term_Node;   
   
   package Linked_List_Term is new Linked_List_Spec(Fol_Term);

   
   subtype Fol_Term_List is Linked_List_Term.Linked_List;
   
   type Fol_Term_Node( N : Fol_Term_Kind ) is
      record
	 Fol_Term_Kind_Val : Fol_Term_Kind;
	 case N is
	    when Fol_Const => 
	       Fol_Const_Val : Natural ;
	    when Fol_Func => 
	       Fol_Func_Val : Natural ;
	       Fol_Func_Arity : Natural ;
	       Fol_Func_Args : Fol_Term_List ;
	    when Fol_Var =>
	       Fol_Var_Val : Natural ;
	 end case;
      end record;
   
   type Fol_Formula_Node( T : Fol_Kind );
   
   type Fol_Formula is access all Fol_Formula_Node;
   
   type Fol_Formula_Node( T : Fol_Kind ) is
      record
	 Fol_Formula_Kind_Val : Fol_Kind;
   	 case T is
   	    when Fol_Pred =>
   	       Fol_Pred_Val : Natural;
   	       Fol_Pred_Arity : Natural;
   	       Fol_Pred_Args : Fol_Term_List;
   	    when Fol_Forall =>
   	       Fol_Forall_Var : Natural;
   	       Fol_Forall_Arg : Fol_Formula;
   	    when Fol_Neg =>
   	       Fol_Neg_Arg : Fol_Formula;
   	    when Fol_Imp =>
   	       Fol_Imp_Arg_L : Fol_Formula;
   	       Fol_Imp_Arg_R : Fol_Formula;
   	 end case;
      end record;
   
end Fol_Spec;
