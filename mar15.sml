(*Comment in ml code file surrounded by parenthesis and stars*)

(*
Lecture 1-2: ML Variables and data Structures

Identifiers/Variables in ML
	1. Starts with upercase letter, lowercase letter, or '
	2.Followed by zero or more characters from step 1 including _

	Note:
Value declarations
The syntax to bind a value to a variable is
 val <identifier> = <value>

*)

val a = "hello world";
val a = 5.5;
a;
(*
Tuples 
	1. Start with ()
	2. Sequences of values seperated by,
	3. Ends with)
If the components of the tuple are of type t1, t2, t3 ..., tn, then the type of the tuple  is t1 * t2 * ... U* tn
*)



("daniel",4.4);
(7,true,false);
(("daniel",4.4),8);
((),(),#"a");


(*
Tuple operators
The projection operator for tuples has syntax
	#<digit><tuple>
Returns the value in the tuple corresponding to the digit starting at 1
*)

#2(1,"two",false);

(*
LISTS
	1. Starts with [
	2. Sequence of values seperate by,
	3. End with ]

	If the values in a list are of type T, then the list itself is of type T list
	*Tuples mut be of same type
*)

[2,3,4,5];
[(1,2),(3,4),(5,6)];

[[1,2,3],[4,5],[6]];

[(1,2)];
(1,[2]);

(*
Note: List has more precedence over *

LIST OPERATORS

hd <list>
        returns the head I.E first elemnt of list

tl <list>
        returns the tail i.e, the list without the head
<list1: T> @ <list2: T>
        concatenation of two lists(0f the same type)

<value:t> :: <list : T list>
        Append an element onto the head of a list. The :: opertors is called
        cons
        Note:cons is right associative

*)
hd [2,3,5,7];
tl [2,3,5,7];
[2,3,4,5]@[7,11,13];
2::[3,5,7];
2::3::[5,7,11];
[()];
[];

(*
An apostrophe followed by a letter is pronounces as the corresponding greek
letter. It is ML's place holdet type when the type is not known to the compiler.

The literals for any empty list are [] and nil

*)
nil;

(*
BUILT-IN LIST FUNCTIONS

explode <string>
        Returns a char list from the string
implode <char list>
        Returns a string form a charlist
concat <string list>
        concatenate a list of string into one string

NOTE: yopu can add parenthesis around expression to force precedence evaluations
*)
explode "jason";
implode it;
concat["ja","son"];
explode(concat ["ja","son"]);



