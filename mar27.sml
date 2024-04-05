(*
Continue lecture 1-4

MAP FUNCTION
The syntax for the map funtion is
   map <funtion> <list>
that returns the list after the funtion has been applied to each elemtn of the list
*)
map;
map(fn x=> x*x) [2,3,5,7];

(*
Ex. Use the map funtion to append "ed" at the end of every string on a list. For
example the input ["box","fix","lock"] should return ["boxed","fixed",locked].



*)
map(fn x=> x^"ed") ["box","fix","lock"];

(*
the built in rreducede funtions in ML are called foldl and foldr. Their syntax is
  <foldl> or <foldr> two-var funtions <inititial value> <list>
that take the fuction and applies it continuously to every element of the starting with the inititial value.
*)
foldl;

fun myfun (cv,acc) = cv+acc;

foldl myfun 0 [2,3,5,7];
foldr myfun 0 [2,3,5,7];

(*
Ex. Use one of the reduce funtion to concatenate all strings in a list. For
example,
  - <foldl or foldr> <f> <IV> ["use", "the", "force"];
val it = "usetheforce" :string
*)
foldl (fn (cv,acc) => acc^cv) "" ["use", "the", "force"];

(*
Ex. Use onw of the reduce funtions to duplicate all the elements of a list. For example,
  -<fold l or r> <f> <IV> [2,3,5,7]
  val it = [2,2,3,5,5,7,7] :  int list 
*)
foldr (fn (cv,acc) => cv::cv::acc) [] [2,3,5,7];

(*
lecture 1-5: Adv types

NEW TYPE: a' option
This new type has "twp values"
  NONE
  SOME x (* where x is of type 'a *)
*)
SOME 3;
SOME "winkelmann";
NONE;
val L = [SOME 2, NONE, NONE,NONE,SOME 3,SOME 5,NONE,SOME 7,NONE];

(*
The option type allows "null values" that can represent "no answer", "no value",
"no response", etc.
*)
length(L);

(*
Ex. Write an example a recursive function with patterb matching with name and type
 intopsum : int option list -> list
that inputs a list of int options and returns the sum of of all integers of the
list while ignoring any instance of None. For example,
 -intopsum L;
val it = 17 : int
*)
fun intopsum [] = 0
  |intopsum (NONE::xs) = intopsum(xs)
  |intopsum ((SOME s) :: xs) = s+intopsum(xs);

intopsum L;

(*
Ex. Write a reciuresive funtion w/ pattern matching w/ name and types
  stopsum : string option list -> string
that inputs a list string options and returns the concatenation of all strings
on the list whilst ignoring any instances of NONE. For example,
  -stopsum [NONE,SOME,"hello",SOME "world",NONE];
  val it = "helloworld" : string

Ex. write a recursive funtion with pattern matching w/ name and typee
  strip : 'a option list -> 'a list
that inputs a list options and removes all SOMES and NONEs leaving just the
value in the list.
*)
fun stopsum [] = ""
  |stopsum (NONE::xs) = stopsum(xs)
  |stopsum ((SOME s) :: xs) = s^stopsum(xs);

stopsum [NONE,SOME "hello",SOME "world",NONE];

fun strip [] = []
  |strip (NONE::xs) = strip(xs)
  |strip ((SOME s)::xs) = s::strip(xs);

  strip L;
  ()
