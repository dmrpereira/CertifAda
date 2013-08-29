package body Env is

   function Wf_Empty_Env (E : in Environment) return Boolean is
   begin
      if (E = null) then
	 return True;
      end if;
      return False;

   end Wf_Empty_Env;



end Env;
