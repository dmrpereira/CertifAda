with Ada.Text_IO; use Ada.Text_IO;
with Language_Spec;

package Re_Spec is
   
   type Re_Kind is (Re0,Re1,Re_Sy,Re_P,Re_C,Re_S);
   type Re is private;
   
   function What_Re_Kind(X:Re) return Re_Kind;
   
   function Build_Re0 return Re;
   function Build_Re1 return Re;
   function Build_P(L,R:Re) return Re;
   
   procedure Show(R:Re);
   
private
   
   type Re_Node(T:Re_Kind);
   
   type Re is access all Re_Node;
   
   type Re_Node(T:Re_Kind) is
      record
	 case T is
	    when Re_Sy => Re_Symbol : Natural;
	    when Re_P  => Re_P_L, Re_P_R : Re;
	    when Re_C  => Re_C_L, Re_C_R : Re;
	    when Re_S  => Re_S_Arg : Re;
	    when others => null;
	 end case;
      end record;
   
   
end Re_Spec;

	       
   
