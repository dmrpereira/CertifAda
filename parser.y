%token '(' ')' '{' '}'
%token NATURAL STRING BOOLVAL

%right ASSG 
%left '+' '-'

%token ID
%token SYSTEM
%token COMPONENT
%token TASK
%token WITH
%token FUNC
%token PROC
%token PARAM_IN
%token PARAM_OUT
%token RETURN
%token NULL 

%token LT
%token GT
%token LE
%token GE
%token EQ
%token NEQ

%token SPECS
%token PRE
%token DYN_PRE
%token POST
%token DYN_POST
%token GUARANTEE
%token ASSERT
%token DYN_ASSERT
%token FORALL
%token EXISTS
%token IMP
%token EQUIV
%token OR
%token AND
%token NOT

%token VARS
%token OPS
%token BEGIN
%token END

%token PARAM_SCH
%token SCH_ALG

%token PARAM_PRD
%token PARAM_DDL
%token PARAM_TIME 
%token TIME_UNIT

%token ASSG

%token ADD
%token SUB
%token MUL
%token DIV
%token MOD

%token EQ
%token NEQ
%token LT
%token GT
%token LE
%token GE
%token SEQ

%token IF
%token FI
%token THEN
%token ELSE
%token ELIF

%token WHILE
%token DO
%token DONE
%token VARIANT
%token INVARIANT

%token DELAY
%token DELAYUNTIL

%token TYPE_NAT
%token TYPE_BOOL
%token TYPE_STRING
%token TYPE_FLOAT

{
	

}

%%

sys : SYSTEM ID system_body END ID SEQ;

system_body : COMPONENT;

aexp : aexp ADD aexp {}
    |  aexp SUB aexp {}
    |  aexp MUL aexp {}
    |  aexp DIV aexp {}
    |  aexp MOD aexp {}
    |  ID {}
    |  NATURAL {}
;

bexp : aexp LT aexp {}
    |  aexp GT aexp {}
    |  aexp GE aexp {}
    |  aexp LE aexp {}
    |  aexp EQ aexp {}
    |  aexp NEQ aexp {}
    |  bexp AND bexp {}
    |  bexp OR bexp {}
    |  BOOLVAL  {}
;

%%
