package Arith_Expr_Spec is
   
   type Arith_Exp_Type is (Arith_Exp_Const,Arith_Exp_Var,Arith_Exp_Sum);
   -- More expressive kind of expression constructors be added
   
   type Arith_Exp is private;
   
   function Well_Formed( E : in Arith_Exp ) return Boolean;
   function Evaluate_Iter( E : in Arith_Exp ; N : in Natural ) return Arith_Exp;
   function Evaluate_Eager( E : in Arith_Exp ) return Natural ;
   
private
   
   type Arith_Exp_Node(T:Arith_Exp_Type);
   
   type Arith_Exp is access all Arith_Exp_Node;
   
   type Arith_Exp_Node(T:Arith_Exp_Type) is
      record
	 Arith_Exp_Node_Type : Arith_Exp_Type;
	 case T is
	    when Arith_Exp_Const =>
	       Arith_Exp_Node_Cons : Natural;
	    when Arith_Exp_Var =>
	       Arith_Exp_Node_Var : Natural ;
	    when Arith_Exp_Sum => 
	       Arith_Exp_Node_Sum_L : Arith_Exp;
	       Arith_Exp_Node_Sum_R : Arith_Exp;
	 end case;
      end record;
      
end Arith_Expr_Spec;
