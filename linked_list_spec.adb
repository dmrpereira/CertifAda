package body Linked_List_Spec is
   
   function Head(L:in Linked_List) return T is
   begin
      return L.List_Node_Val;
   end Head;
         
   function Tail(L:in Linked_List) return Linked_List is
   begin
      return L.List_Node_Next;
   end Tail;
      
   function Cons(X:in T;L: in Linked_List) return Linked_List is
      L1 : Linked_List := new Linked_List_Node ;
   begin
      L1.List_Node_Val := X;
      L1.List_Node_Next := L;
      return L1;
   end Cons;
         
   function App(L1,L2: in Linked_List) return Linked_List is
   begin
      if L1 = null then
	 return L2;
      else
	 L1.List_Node_Next := App(L1.List_Node_Next,L2);
	 return L1;
      end if;
   end App;
   
   function For_All(L:in Linked_List;F:Filter_Access) return Boolean is
   begin
      if L = null then
	 return True;
      else
	 if F(Head(L)) = False then
	    return False;
	 else
	    return For_All(L.List_Node_Next,F);
	 end if;
      end if;
   end For_All;
   
   function Exists(L:in Linked_List;F:Filter_Access) return Boolean is
   begin
      if L = null then
	 return False;
      else
	 if F(Head(L)) = True then
	    return True;
	 else
	    return Exists(L.List_Node_Next,F);
	 end if;
      end if;
   end Exists;
      
end Linked_List_Spec;
