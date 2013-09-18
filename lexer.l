BOOLVAL ("true"|"false")
NATURAL (0|([1-9]([0-9])*))
IDENTIFIER [a-zA-Z]([_a-zA-Z0-9])*

SYSTEM "system"
COMPONENT "component"
TASK "task"

WITH "with"

FUNC      "fun"
PROC      "proc"
PARAM_IN  "in"
PARAM_OUT "out"
RETURN "return"

SPECS "specs"
PRE "@pre"
POST "@post"
GUARANTEE "@guarantee"
FORALL "forall"
EXISTS "ex"
IMP "->"
EQUIV "<->"
OR "or"
AND "and"
NOT "not"


VARS "vars"
OPS "ops"
BEGIN "begin"
END "end"

PARAM_SCH   "Scheduler"
SCH_ALG ("RM"|"EDF"|"DM")

PARAM_PRD   "Period"
PARAM_DDL   "Deadline"
PARAM_TIME  "TimeUnit"
TIME_UNIT ("NanoSecs"|"Secs"|"MiniSecs")

ASSG (:=)

SEQ ";"

IF "if"
FI "fi"
THEN "then"
ELSE "else"
ELIF "elif"

WHILE "while"
DO "do"
DONE "done"
VARIANT "variant"
INVARIANT "inv"

DELAY "delay"
DELAYUNTIL "delay_until"

TYPE_NAT    "nat"
TYPE_BOOL   "bool"
TYPE_STRING "string"
TYPE_FLOAT  "float"

LPAR "("
RPAR ")"
LBRAC "{"
RBRAC "}"

%%

-- {} {Text_IO.Put();}
{NATURAL}      { Text_IO.Put("NatVal(" & YYText &")");}
{BOOLVAL}     { Text_IO.Put("BoolVal("& YYText &")");}

-- Operators
("=="|"!="|">"|"<")    { Text_IO.Put("Comp("& YYText &")");}
("+"|"-"|"*"|"div"|"mod")     { Text_IO.Put("Op("& YYText &")");}

-- Program structure tokens
{SYSTEM}       { Text_IO.Put("SYSTEM");}
{COMPONENT}    { Text_IO.Put("COMPONENT");}
{TASK}       { Text_IO.Put("TASK");}
{FUNC}       { Text_IO.Put("FUNC");}
{PROC}       { Text_IO.Put("PROC");}
{RETURN}     { Text_IO.Put("RET");}
{WITH} { Text_IO.Put("WITH");}
{SPECS}|{VARS}|{OPS} {Text_IO.Put("SECTION("&YYText&")");}
-- Real-time parameters for system, components, and tasks
{PARAM_SCH}|{PARAM_DDL}|{PARAM_PRD}|{PARAM_TIME} {Text_IO.Put("RTPARAM("&YYText&")");}
-- Formal specifications
{PRE}|{POST}|{GUARANTEE}  {Text_IO.Put("SPEC("&YYText&")");}


-- Function/Procedure parameters
{PARAM_IN}|{PARAM_OUT} { Text_IO.Put("Param("& YYText &")");}


{VARS}       { Text_IO.Put("VARS");}
{OPS}       { Text_IO.Put("OPS");}
--{RT_PARAM}     { Text_IO.Put("RTPARAM");}
--{RT_PARAM_NAME} { Text_IO.Put("RTARG(" & YYText & ")");}
{SCH_ALG}      { Text_IO.Put("SCHALG(" & YYText & ")");}
{TIME_UNIT} { Text_IO.Put("TU(" & YYText & ")");}
{BEGIN}         { Text_IO.Put("BEGIN");}


-- Sequential tokens
{ASSG}         { Text_IO.Put("ASSG");}
{SEQ}          { Text_IO.Put(";");}
{END}          { Text_IO.Put("END"); }
{IF}           { Text_IO.Put("IF"); }
{THEN}         { Text_IO.Put("THEN"); }
{ELSE}         { Text_IO.Put("ELSE"); }
{ELIF}         { Text_IO.Put("ELIF"); }
{WHILE}        { Text_IO.Put("WHILE"); }
{VARIANT}      { Text_IO.Put("VARIANT");} 
{DO}           { Text_IO.Put("DO"); }
{DONE}         { Text_IO.Put("DONE"); }
{TYPE_NAT}|{TYPE_FLOAT}|{TYPE_STRING}|{TYPE_BOOL} { Text_IO.Put("TYPE(" & YYText & ")"); }

-- Assertion Language tokens
{FORALL}|{EXISTS} { Text_IO.Put("Quantif("&YYText&")");}
{IMP}|{EQUIV}|{NOT}|{AND}|{OR} { Text_IO.Put("LOp("&YYText&")");}

{IDENTIFIER}   { Text_IO.Put("ID(" & YYText &")"); }
\n             { Text_IO.New_Line; }


%%

with Ada.Command_Line; use Ada.Command_Line;

procedure Lexer is

type Token is (End_of_Input, Error);

##

fd : Text_IO.File_Type;
tok : Token;

begin
  open_input(Argument(1));
 
  doit:
  loop
   tok := yylex;
   exit doit when yy_eof_has_been_seen;
  end loop doit;

  close_input;
end Lexer;




