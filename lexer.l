
GEN_CHAR [<>!+-%@]
LPAR "("
RPAR ")"
LBRAC "{"
RBRAC "}"
SEQ ";"
NATURAL (0|([1-9]([0-9])*))
IDENTIFIER [a-zA-Z]([_a-zA-Z0-9])*
ASSG ":="
SYSTEM "system"
COMPONENT "component"
PRAGMA "pragma"
RT_PARAM "rt_param"
IF "if"
IS "is"
THEN "then"
ELSE "else"
END "end"
WHILE "while"
VARIANT "variant"
DO "do"
TYPE ("Nat"|"Bool")
BOOL_VAL ("true"|"false")
RT_PARAM_ARG ("SchAlg"|"Period"|"Deadline"|"WCET"|"TimeUnit")
TIME_UNIT ("Seconds"|"MiliSeconds")
SCH_ALG ("RM"|"EDF"|"DM")

%%

-- {} {Text_IO.Put();}
{SEQ} {Text_IO.Put("Seq");}
{ASSG} {Text_IO.Put("AssgTo");}
{NATURAL} { Text_IO.Put("NatVal(" & YYText &")");}
{BOOL_VAL} { Text_IO.Put("BoolVal("& YYText &")");}
{SYSTEM} { Text_IO.Put("System");}
{SCH_ALG} { Text_IO.Put("Algorithm(" & YYText & ")");}
{COMPONENT} { Text_IO.Put("Component");}
{RT_PARAM} { Text_IO.Put("RealTimeParameter");}
{RT_PARAM_ARG} { Text_IO.Put("RealTimeArg(" & YYText & ")");}
{PRAGMA} { Text_IO.Put("Pragma");}
{END} { Text_IO.Put("End");}
{IS} { Text_IO.Put("Is");}
{THEN} { Text_IO.Put("Then");}
{ELSE} { Text_IO.Put("Else");}
{WHILE} { Text_IO.Put("While");}
{DO} { Text_IO.Put("Do");}
{TYPE} { Text_IO.Put("Type(" & YYText & ")");}
{IDENTIFIER} { Text_IO.Put("Id(" & YYText &")");}
\n { Text_IO.New_Line; }


%%

with Ada.Command_Line; use Ada.Command_Line;

procedure Lexer is

type Token is (End_of_Input, Error);

##

fd : Text_IO.File_Type;
tok : Token;
package Bool_IO is new Enumeration_IO(Boolean);

begin
  open_input(Argument(1));
 
  doit:
  loop
   tok := yylex;
   exit doit when yy_eof_has_been_seen;
  end loop doit;

  close_input;
end Lexer;




