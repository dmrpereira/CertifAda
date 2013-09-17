
NATURAL (0|[1-9][0-9]*)
VAR_ID ([a-z]|[A-Z])([0-9]|[a-z]|[A-Z])*


%%

NATURAL { Text_IO.Put("Found Natural Number"); Text_IO.New_Line; }
VAR_ID { Text_IO.Put("Found Variable Name"); Text_IO.New_Line; }
\n { Text_IO.Put("Found NewLine") ; Text_IO.New_Line; }
. { Text_IO.put("Found something wrong!!!"); Text_IO.New_Line; }

%%

with Ada.Command_Line; use Ada.Command_Line;

procedure Lexer is

type Token is (End_of_Input, Error);

##

begin

  Text_IO.Put(Command_Name);
  Text_IO.New_Line;

end Lexer;




