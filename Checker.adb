package body Checker is

   function Id_Hashed (N : in Natural) return Hash_Type is
   begin
      return Hash_Type'Val(N);
   end Id_Hashed;

   function Env_Check_Basic_Sorts (E : Environment; Sl, Sr : in CIC_Sort_Access) return Boolean is
   begin
      return True;
   end Env_Check_Basic_Sorts;




end Checker;
