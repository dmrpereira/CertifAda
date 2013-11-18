package Global_types is

   type Pos_Natural is new Natural range 1 .. Natural'Last;
   -- The type of positive natural numberss

   type Integer_Array is array (Natural range <>) of Integer;
   -- The type of unbounded arrays of integer values

   type Natural_Array is array (Natural range <>) of Natural;
   -- The type of unbounded arrays of natural valuess

   type Pos_Natural_Array is array (Natural range <>) of Pos_Natural;
   -- The type of unbounded arrays of positive natural numberss


end Global_Types ;
