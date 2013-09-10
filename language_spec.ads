with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

generic
   type Syntax is private;

package Language_Spec is
   
   type Abstract_Term is abstract tagged private;

private
   
   type Abstract_Term is abstract tagged
      record
	 Formula : Syntax;
      end record;

end Language_Spec;
