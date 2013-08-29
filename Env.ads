with CIC; use CIC;

package Env is

   type CIC_Type_Judgment is
      record
	 Judgment_Var : Natural;
	 Judgment_Term : CIC_Term_Access;
      end record;
   -- A single judgment in CIC is a typing relation [ x : t ], determining if
   -- [ x ] has the type [ t ]

   type Environ;
   -- Partial definition of the type of linked lists of judgments

   type Environ_Access is access all Environ;
   -- Pointer to a linked list of judgments

   type Environ is
      record
	Current_Judgment : CIC_Type_Judgment;
	Next_Judgment : Environ_Access;
      end record;
   -- Definite definition of [Environ]

   type Environment is access all Environ;
   -- A pointer to an environment, i.e., a linked list of

   function Wf_Empty_Env (E : in Environment) return Boolean;

end Env;
