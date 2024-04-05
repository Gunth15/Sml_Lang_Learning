(*
Cont Lecture 1-5

CUSTOM DATA TYPES
The syntax to create a custom data type is
  datatype <typename> = <val> | <val2> | <...>

  where each value can be a literal or a constructor of the form
    <constructor>
*)

datatype color = blue | red | yellow;

blue;

(*
Rev. The java code for a linked list node is

 public class Node {
    public int data;
    public Node next;
 }

Let's do the ml version of this
*)
datatype linkedlist = empty | node of int * linkedlist;

empty;
val L1 = node(2,empty);
val L2 = node(2,node(3,empty));
val L3 = node(2,node(3,node(5,empty)));

(*
Now let's define the standard funtions to manipulate linked lists in ML

Ex. Write the isempty funtion for linkedlists
*)
fun isEmpty empty = true
  |isEmpty (node(_,_)) = false;

  isEmpty(L1);
  isEmpty(empty);


  (*
  Ex. Write a function named linksize : linkedlists -> int that returns the size
  of a linkedlists

  Ex. Write a function using recursion and pattern matching with name and type:
      sortedMerge: linkedlists * linkedlists -> int list
  *)
fun linksize empty = 0
  |linksize (node(_,x)) = 1 + linksize(x);


linksize(L3);


fun sortedMerge (empty,empty) = []
  |sortedMerge (empty,node(x,y)) = x::sortedMerge(empty,y)
  |sortedMerge (node(x,y),empty) = x::sortedMerge(y,empty)
  |sortedMerge (A as node(x,y), B as node(s,t)) = if x <= s then
    x::sortedMerge(y,B)  else s::sortedMerge(A,t);


sortedMerge(L2,L3);
