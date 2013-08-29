with CIC; use CIC;
with Env; use Env;
with Ada.Containers.Hashed_Maps; use Ada.Containers;

package Checker is

   function Id_Hashed (N : in Natural) return Hash_Type;

   function Env_Check_Basic_Sorts(E:Environment; Sl,Sr:in CIC_Sort_Access) return Boolean;

end Checker;
