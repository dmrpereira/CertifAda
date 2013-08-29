with CIC; use CIC;
with Env; use Env;
with Checker; use Checker;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   E : Environment := null;
   package PrintBool is new Enumeration_IO(Boolean);
begin
   PrintBool.Put(Wf_Empty_Env(E));
   null;
end Main;
