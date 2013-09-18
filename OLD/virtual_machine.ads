with Global_Types; use Global_Types;
with Stack_Spec;
with Instruction_Spec; use Instruction_Spec;

package Virtual_Machine is

   package Integer_Stack is new Stack_Spec (Stack_Val => Integer);
   use Integer_Stack;

   type Registers is array(Positive range 1.. 32) of Integer;

   type Memory is array (Natural range <>) of Integer;

   type State is
      record
	 Pc : Natural;
	 Regs : Registers;
	 Ram  : Memory (0 .. 255);
	 Exec_Stack : Stack(100);
      end record;

   type Configuration is
      record
	 Program : Compiled_Program(0..100);
	 Current_State : State;
      end record;

   function Init_Evaluation (Prog : in Compiled_Program) return Configuration;
   -- Return an initial configuration for the program given as argument

   function Arg_Vi ( C : in Instr ; N : in Max_Args ) return Integer
   with Pre => ( N <= C.Nargs ) ;
   -- Returns the Integer Value on the [N]'th parameter of instruction [C]

   procedure Eval_One_Step (Conf : in out Configuration);
   -- Perform the execution of one instruction and update the configuration
   -- accordingly

private

   procedure State_Init_Regs (S : in out State);
   procedure State_Init_Memory (S : in out State);
   procedure State_Init_Stack (S : in out State);



end Virtual_Machine;
