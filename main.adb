with Ada.Text_IO; use Ada.Text_IO;
with Linked_List_Spec;
with re_spec; use re_spec;
with fol_spec; use fol_spec;

procedure Main is
   package PrintBool is new Enumeration_IO(Boolean);
   package ReList is new Linked_List_Spec(Re); use ReList;
   
   function F(X:Re) return Boolean is
   begin
      return (What_Re_Kind(X) = Re0);
   end F;
      
   X,Y : Re;
   V : Linked_List := null;
   
   
   
   
begin
   X := Build_P(Build_Re0,Build_Re1);
   Y := Build_Re0;
   V := Cons(X,V); V := Cons(Y,V);
   
   Show(Head(V)); New_Line; Show(Head(Tail(V))); New_Line;
   PrintBool.Put(For_All(V,F'Access));
   New_Line;
   PrintBool.Put(Exists(V,F'Access));
end Main;
