generic
   type Stack_Val  is private;

package stack_spec is

   type Stack(N:Natural) is private;

   function Is_Empty (S : in Stack) return Boolean;
   function Is_Full ( S : in Stack) return Boolean;

   procedure Push (V : in Stack_Val; S : in out Stack)
   with Pre => (Is_Full(S) /= True);
   function Pop (S : in out Stack) return Stack_Val
   with Pre => (Is_Empty (S) /= True);

   function New_Stack(N:in Natural) return Stack;


private

   type Stack_Val_Array is array (Natural range <>) of Stack_Val;

   type Stack(N:Natural) is
      Records
	 Sc : Natural;
	 Stack_Val : Stack_Val_Array (0 .. N);
      end record;


end stack_spec;
