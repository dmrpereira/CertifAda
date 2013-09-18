%token '(' ')' '{' '}'
%token NATURAL STRING BOOLVAL

%right ASSG 
%left '+' '-'

%ID
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

LPAR "("
RPAR ")"
LBRAC "{"
RBRAC "}"




{
	

}

%%