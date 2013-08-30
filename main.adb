with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   package PrintBool is new Enumeration_IO(Boolean);
begin
   PrintBool.Put(true);
   null;
end Main;
