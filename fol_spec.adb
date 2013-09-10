package body Fol_Spec is
   
   function Build_Fol_Term_Var( X : in Natural) return Fol_Term is
      V : Fol_Term := new Fol_Term_Node(Fol_Var);
   begin
      V.Fol_Term_Kind_Val := Fol_Var;
      V.Fol_Var_Val := X;
      return V;
   end Build_Fol_Term_Var;
   
   
   function Is_Fol_Term_Var( X : in Fol_Term ) return Boolean is
   begin
      return (X.Fol_Term_Kind_Val = Fol_Var);
   end Is_Fol_Term_Var;
   
   function Unify_Fol_Term_Var( X , Y : in Fol_Term ) return Boolean is
   begin
      return (X.Fol_Term_Kind_Val = Y.Fol_Term_Kind_Val and X.Fol_Var_Val = Y.Fol_Var_Val);
   end Unify_Fol_Term_Var;
      
end Fol_Spec;
