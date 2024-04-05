(*
Lecture 1-4: ML Recursion (and lists)

NOTE: In ML/functional language, loops are frowned upon!

NOTE: There is a bulit-in function to return  the length of a list called length
*)

length;
length([2,3,5,7]);

(*
for Write own length function named mylength using Recursion
*)

fun mylength L = if L = [] then 0 else 1+mylength(tl(L));
mylength(nil);
mylength([2,3,5,7]);

(*
''a means that you are using the comparison operators that is only for certain
types. (Are you sure you wanna do this?)

This style is still not completely proper. A better way to defie functions in ML
is to use pattern matching. The syntax for pattern matching is
  fun <identifier> <pattern1> = <exp1>
    |<identifier> <pattern2> = <exp2>
    <...>
    | <identifier> <pattern-n> = <exp-n>

and allowed <patterns> are constants/literals or expressions with ::

Ex. lets  repeat the previous ex with pattern matching
*)
fun mylength2 [] = 0
    |mylength2 (_::xs) = 1+mylength2(xs);

mylength2([2,3,5,7]);

(*
NOte that x is not used, so you can replace it with _(wildcard)

NEW SYNTAX: The case reserved word sort of plays the role of "switch" and has syntax
case <expression> of <match>
and then <match> will have syntax
  <pattern> => <exp1> | <patterns => <exp2> | <...> | <pattern-n> => <exp-n>

This is just an alternative way to do pattern matching (if you have a lot of cases to code).
The previous example can be cided with case as follows
*)
fun mylength3 L = case L of [] => 0 | (_::xs) => 1 + mylength3(xs);

(*
Ex. Write a recursive funtion using oattern matching with name/type
  lsum : int list ->
That inputs a ist of integers and returns their sum. For ex
 -lsum([2,3,5,7]);
val it = 17 : int

Ex.  for patterns matching instead of lists , write recursive funtion using
pattern matching with name/type
  fact: int -> int
that inputs non-negative integersand returns its functional value. For example
  fact(4);
val it = 24: int

Ex. write a recursive funtion using pattern matching with name/type
  lpairsum : (int * int) list -> int
that inputs a list of integer pairs and returns the sum of all integers. For example,
 -lpairsum([(2,3),(5,7)]);
val it = 17 :int
*)

fun lsum [] = 0
  |lsum (x::xs) = x + lsum(xs);

lsum([2,3,5,7]);

fun fact 0 = 1
  |fact m = m * fact(m-1);

fun lpairsum [] = 0
  | lpairsum ((x,y)::xs) = x+y+lpairsum(xs)

(*
NEW SYNTAX: and
Allows you to do more than one declaration simultaneously


*)
val a = 3 and b = 4

(*
Ex wrte mutually recursive functions with pattern matching named isOdd andisEven that
input non-negative int and returns  the proper boolean value. For ex.
  - isOdd(0)
  false
  -isEven(4);
val it = true : bool

*)
fun isOdd 0 = false | isOdd n = isEven(n-1)
  and 
  isEven 0 = true | isEven n = isOdd(n-1);

isOdd(2);

