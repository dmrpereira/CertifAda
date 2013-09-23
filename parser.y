%token '(' ')' '{' '}'
%token NATURAL STRING BOOLVAL

%right ASSG 
%left '+' '-'

%token ID
%token SYSTEM_kw
%token COMPONENT_kw
%token TASK_kw
%token WITH_kw
%token FUNC_kw
%token PROC_kw
%token PARAM_IN_kw
%token PARAM_OUT_kw
%token RETURN_kw
%token NULL_kw 

%token LT
%token GT
%token LE
%token GE
%token EQ
%token NEQ

%token SPECS_kw
%token PRE_kw
%token DYN_PRE_kw
%token POST_kw
%token DYN_POST_kw
%token GUARANTEE_kw
%token ASSERT_kw
%token DYN_ASSERT_kw
%token FORALL_kw
%token EXISTS_kw
%token IMP_kw
%token EQUIV_kw
%token OR_kw
%token AND_kw
%token NOT_kw

%token VARS
%token OPS
%token BEGIN_kw
%token END_kw

%token PARAM_SCH_kw
%token SCH_ALG_kw

%token PARAM_PRD
%token PARAM_DDL
%token PARAM_TIME 
%token TIME_UNIT

%token ASSG

%token SEQ

%token ADD
%token SUB
%token MUL
%token DIV_kw
%token MOD_kw

%token IF_kw
%token FI_kw
%token THEN_kw
%token ELSE_kw
%token ELIF_kw

%token WHILE_kw
%token DO_kw
%token DONE_kw
%token VARIANT
%token INVARIANT

%token DELAY_kw
%token DELAYUNTIL_kw

%token TYPE_NAT
%token TYPE_BOOL
%token TYPE_STRING
%token TYPE_FLOAT

%start sys

%with Ada.Strings.Unbounded;
%use  Ada.Strings.Unbounded;

{

    subtype yystype is Unbounded_String;

    aux_str : Unbounded_String := Null_Unbounded_String;

}

%%

sys : SYSTEM_kw ID system_body END_kw ID SEQ { $$ := Null_Unbounded_String; }
;

system_body : assumptions component_seq {  $$ := Null_Unbounded_String; } 
;

assumptions : ID { $$ := Null_Unbounded_String; }
;

var_ass : 
;

ops_ass :
;

spec_ass :
;

component_seq : ID { $$ := Null_Unbounded_String; }
;

%%

with parser_tokens, lexer_io, parser_goto, parser_shift_reduce;
with lexer, text_io, ada.strings.unbounded;

use parser_tokens, lexer_io, parser_goto, parser_shift_reduce;
use lexer, text_io, ada.strings.unbounded;


package Parser is
    procedure yyparse;
end Parser;

package body Parser is

    procedure yyerror(s: string) is
    begin
        text_io.put(s);
    end yyerror;

##

end Parser;


