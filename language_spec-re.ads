package Language_Spec.Re is

   type Re is new Syntax with private;

   function Is_Re0 (X : Re) return Boolean;
   function Is_Re1 (X : Re) return Boolean;
   function Is_Re_Sy ( X : Re) return Boolean;
   function Is_Re_P (X : Re) return Boolean;
   function Is_Re_C (X : Re) return Boolean;
   function Is_Re_S (X : Re) return Boolean;

   function Build_Re0 return Re;
   function Build_Re1 return Re;
   function Build_Re_Sy ( X : Natural) return Re;
   function Build_Re_P ( X,Y : Re) return Re;
   --function Build_Re_C ( X,Y : Re) return Re;
   --function Build_Re_S ( X : Re) return Re;


private

   type Re_Type is (Re0,Re1,Re_Sy,Re_P,Re_C,Re_S);

   type Re_Struct( T : Re_Type );

   type Re_Struct_Access is access all Re_Struct;

   type Re_Struct ( T : Re_Type ) is
      record
	 --Local_Re_Type : Re_Type ;
	 case T is
	 when Re_Sy => Symbol : Natural;
	 when Re_P =>  P_Arg_L, P_Arg_R : Re_Struct_Access;
	 when Re_C => C_Arg_L, C_Arg_R  : Re_Struct_Access;
	 when Re_S => S_Arg             : Re_Struct_Access;
	 when others => null;
	 end case;
      end record;


   type Re is new Syntax with
      record
	 Re_Val : Re_Struct_Access;
      end record;

   function Type_Of_Re (X:in Re) return Re_Type ;

end Language_Spec.Re;
