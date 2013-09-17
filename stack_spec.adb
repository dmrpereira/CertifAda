package body stack_spec is

   function New_Stack (N : in Natural) return Stack is
      S : Stack(N) ;
   begin
      S.Sc := 0;
      return S;
   end New_Stack;


   function Is_Empty (S : in Stack) return Boolean is
   begin
      return (S.Sc = 0);
   end Is_Empty;

   function Is_Full ( S : in Stack) return Boolean is
   begin
      return (S.Sc = 99);
   end Is_Full;


   procedure Push (V : in Stack_Val; S : in out Stack) is
   begin
      S.Sc := S.Sc + 1;
      S.Stack_Val (S.Sc) := V;
   end Push;

   function Pop (S : in out Stack) return Stack_Val is
      V : Stack_Val;
   begin
      V := S.Stack_Val (S.Sc) ;
      S.Sc := S.Sc - 1 ;
      return V;
   end Pop;

end stack_spec;
