package body Re_Spec is
   
   
   
   function What_Re_Kind(X:Re) return Re_Kind is
   begin
      return X.T;
   end What_Re_Kind;
      
   function Build_Re0 return Re is
   begin
      return (new Re_Node(T => Re0));
   end Build_Re0;
   
   function Build_Re1 return Re is
   begin
      return (new Re_Node(T => Re1));
   end Build_Re1;
      
   function Build_P( L,R : Re) return Re is
      X : Re;
   begin
      X := new Re_Node(T => Re_P);
      X.Re_P_L := L;
      X.Re_P_R := R;
      return X;
   end Build_P;
   
   procedure Show(R:Re) is
   begin
      case R.T is
	 when Re0 => Put("0");
	 when Re1 => Put("1");
	 when Re_P =>
	    Put("(");
	    Show(R.Re_P_L);
	    Put("+");
	    Show(R.Re_P_R);
	    Put(")");
	 when Others => null;
      end case;
   end Show;
          
   
end Re_Spec;

      










