BOOLVAL ("true"|"false")
NATURAL (0|([1-9]([0-9])*))
ID [a-zA-Z]([_a-zA-Z0-9])*
STRING (\"([^\\\"\n]|\\.)*[\"\n])

SYSTEM "system"
COMPONENT "component"
TASK "task"

WITH "with"

FUNC      "fun"
PROC      "proc"
PARAM_IN  "in"
PARAM_OUT "out"
RETURN "return"
NULL "null"

SPECS "specs"
PRE "@pre"
DYN_PRE "@dynamic_pre"
POST "@post"
DYN_POST "@dynamic_post"
GUARANTEE "@guarantee"
ASSERT "@assert"
DYN_ASSERT "@dynamic_assert"
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

-- Toplevel Structural units
{SYSTEM}       { Text_IO.Put("SYSTEM");}
{COMPONENT}    { Text_IO.Put("COMPONENT");}
{TASK}       { Text_IO.Put("TASK");}
{FUNC}       { Text_IO.Put("FUNC");}
{PROC}       { Text_IO.Put("PROC");}

-- Section definitions
{WITH} { Text_IO.Put("WITH");}
{SPECS}|{VARS}|{OPS} {Text_IO.Put("SECTION("&YYText&")");}

-- Real-time parameters for system, components, and tasks
{PARAM_SCH}|{PARAM_DDL}|{PARAM_PRD}|{PARAM_TIME} {Text_IO.Put("RTPARAM("&YYText&")");}

-- Formal specifications	
{PRE}|{POST}|{GUARANTEE}|{ASSERT}  {Text_IO.Put("SPEC("&YYText&")");}
-- Dynamic ones
{DYN_PRE}|{DYN_POST}|{DYN_ASSERT}  {Text_IO.Put("DYN_SPEC("&YYText&")");}


-- Function/Procedure parameters
{PARAM_IN}|{PARAM_OUT} { Text_IO.Put("Param("& YYText &")");}
{RETURN} { Text_IO.Put("RET");}
{NULL} { Text_IO.Put("NULL");}

-- Scheduling algorithms and time unit under consideration
{SCH_ALG}   { Text_IO.Put("SCHALG(" & YYText & ")");}
{TIME_UNIT} { Text_IO.Put("TU(" & YYText & ")");}

-- Block markers
{BEGIN}     { Text_IO.Put("BEGIN");}
{END}          { Text_IO.Put("END"); }


-- Sequential tokens
{ASSG}         { Text_IO.Put("ASSG");}
{SEQ}          { Text_IO.Put(";");}
{IF}           { Text_IO.Put("IF"); }
{THEN}         { Text_IO.Put("THEN"); }
{ELSE}         { Text_IO.Put("ELSE"); }
{ELIF}         { Text_IO.Put("ELIF"); }
{WHILE}        { Text_IO.Put("WHILE"); }
{VARIANT}      { Text_IO.Put("VARIANT");} 
{DO}           { Text_IO.Put("DO"); }
{DONE}         { Text_IO.Put("DONE"); }

-- Time handling statements
{DELAY}        { Text_IO.Put("DELAY"); }
{DELAYUNTIL}   { Text_IO.Put("DELAY_UNTIL");}


-- Currently suported types
{TYPE_NAT}|{TYPE_FLOAT}|{TYPE_STRING}|{TYPE_BOOL} { Text_IO.Put("TYPE(" & YYText & ")"); }
{STRING} { Text_IO.Put("STRING("&YYText&")");}

-- Assertion Language tokens
{FORALL}|{EXISTS} { Text_IO.Put("Quantif("&YYText&")");}
{IMP}|{EQUIV}|{NOT}|{AND}|{OR} { Text_IO.Put("LOp("&YYText&")");}

{ID}   { Text_IO.Put("ID(" & YYText &")"); }
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




