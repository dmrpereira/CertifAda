package CIC is

   type SortTag is (CIC_Set, CIC_Prop, CIC_Type);
   -- Kinds of sorts: Set, Prop, or Type(i), i \in Nat

   type CIC_Sort(tag:SortTag) is
      record
	 sort_tag : SortTag;
	 case tag is
	 	when CIC_Type => type_level : Natural ;
	 	when others => null;
	 end case;
      end record;
   -- The type of sorts: it is a discriminat record because a sort Type must
   -- be indexed by a natural.

   type CIC_Sort_Access is not null access all CIC_Sort;
   -- Pointer to CIC sort type.

   function Is_Not_Type_Sort ( t : in CIC_Sort_Access) return Boolean;
   -- Determine if [t] contains [CIC_Type] as its [sort_tag].

   function Get_SortTag ( t : in CIC_Sort_Access ) return SortTag;
   -- Obtain the tag of [t], hence determining its type.

   function Get_Type_Level (t : in CIC_Sort_Access) return Natural
   with Pre => Is_Not_Type_Sort (t);
   -- Obtain the level in the hierarchy of [t].

   type TermTag is (CIC_Sort_Val, CIC_Var, CIC_Prod, CIC_DependentProd, CIC_App);
   -- Kinds of terms of CIC

   type CIC_Term ;
   -- Partial definition of the type of CIC terms

   type CIC_Term_Access is not null access all CIC_Term;
   -- Pointer to a CIC term type

   type CIC_Term( T : TermTag ) is
      record
	 Term_Tag : TermTag ;
	 case T is
	 when CIC_Sort_Val =>
	    CIC_Sort_Val_Val : CIC_Sort_Access;
	 when CIC_Var =>
	    CIC_Var_Val      : Natural;
	 when CIC_Prod =>
	    CIC_Param_Prod      : Natural;
	    CIC_Param_Prod_Type : CIC_Term_Access;
	    CIC_Prod_Body       : CIC_Term_Access;
	 when CIC_DependentProd =>
	    CIC_Param_DepProd      : Natural;
	    CIC_Param_DepProd_Type : CIC_Term_Access;
	    CIC_DepProd_Body       : CIC_Term_Access;
	 when CIC_App =>
	    CIC_Left_Term  : CIC_Sort_Access;
	    CIC_Right_Term : CIC_Sort_Access;
	 end case;
      end record;
   -- Complete definition of the type of CIC terms.


end CIC;
