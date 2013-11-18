generic
   type T is private;

package Linked_List_Spec is
   
   type Linked_List_Node;
   type Linked_List is access all Linked_List_Node;
   
   type Linked_List_Node is
      record
	 List_Node_Val : T ;
	 List_Node_Next : Linked_List ;
      end record;
   
   function Head(L:in Linked_List) return T
     with Pre => (L /= null);
   function Tail(L:in Linked_List) return Linked_List;
   
   function Length(L:in Linked_List) return Natural;
      
   function Cons(X:in T;L: in Linked_List) return Linked_List
     with Post => (Length(Cons'Result) = Length(L) + 1);
   function App(L1,L2: in Linked_List) return Linked_List
     with Post => (Length(App'Result) = Length(L1)+Length(L2));
   
   type Filter_Access is access function(X:in T) return Boolean;
   
   function For_All(L:in Linked_List;F:Filter_Access) return Boolean;
   function Exists(L:in Linked_List;F:Filter_Access) return Boolean;
   
end Linked_List_Spec;
