package body Language_Spec.Re is

   function Is_Re0 (X : Re) return Boolean is
   begin
      return (if X.Re_Val.T = Re0 then True else False);
   end Is_Re0;


   function Is_Re1 (X : Re) return Boolean is
   begin
      return (if X.Re_Val.T = Re1 then True else False);
   end Is_Re1;

   function Is_Re_Sy ( X : Re) return Boolean is
   begin
      return (if X.Re_Val.T = Re_Sy then True else False);
   end Is_Re_Sy;

   function Is_Re_P (X : Re) return Boolean is
   begin
      return (if X.Re_Val.T = Re_P then True else False);
   end Is_Re_P;

   function Is_Re_C (X : Re) return Boolean is
   begin
      return (if X.Re_Val.T = Re_C then True else False);
   end Is_Re_C;

   function Is_Re_S (X : Re) return Boolean is
   begin
      return (if X.Re_Val.T = Re_S then True else False);
   end Is_Re_S;

   function Type_Of_Re (X : in Re) return Re_Type is
   begin
      return X.Re_Val.T;
   end Type_Of_Re;


   function Build_Re0 return Re is
      R : Re;
   begin
      R.Re_Val := new Re_Struct(T => Re0);
      return R;
   end Build_Re0;

   function Build_Re1 return Re is
      R : Re;
   begin
      R.Re_Val := new Re_Struct(T => Re1);
      return R;
   end Build_Re1;

   function Build_Re_Sy ( X : Natural) return Re is
      R : Re;
   begin
      R.Re_Val := new Re_Struct (T => Re_Sy);
      R.Re_Val.Symbol := X;
      return R;
   end Build_Re_Sy;

   function Build_Re_P ( X,Y : Re) return Re is
      R : Re;
   begin
      R.Re_Val := new Re_Struct (T => Re_P);
      R.Re_Val.P_Arg_L := new Re_Struct (T => Type_Of_Re(X));
      return R;
   end Build_Re_P;

      --function Build_Re_C ( X,Y : Re) return Re;
   --function Build_Re_S ( X : Re) return Re;

end Language_Spec.Re;
