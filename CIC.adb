package body CIC is

   function Is_Not_Type_Sort ( t : in CIC_Sort_Access) return Boolean is
   begin
      if ( t.sort_tag = CIC_Set or t.sort_tag = CIC_Prop) then
	 return false;
      else
	 return true;
      end if;

   end Is_Not_Type_Sort;

   function Get_Type_Level (t : in CIC_Sort_Access) return Natural is
   begin
      if ( t.sort_tag = CIC_Type ) then
	 return t.type_level;
      end if;
      return 0; -- Dummy value! Should replace by partial type in the future
   end Get_Type_Level;


   function Get_SortTag ( t : in CIC_Sort_Access ) return SortTag is
   begin
      return (t.sort_tag);
   end Get_SortTag;

end CIC;
