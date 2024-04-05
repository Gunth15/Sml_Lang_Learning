(*
Continue 1-4 on recursion

NEW SYNTAX: let <declarations> in <expression> end
Allows temporary declarations/bindings that can be used in <expression>. Than it
evaluates to <expression>

Ex. Write a funtion that inputsa a real number and returns its 50th power. We do
not recommend X*X*X*XX*X*X*X*X*X*X*X*X
*)

fun pow50 (x:real) =
  let
    val y = x*x*x*x*x (*Y = x^5*)
    val z = y*y*y*y*y (*z = y^5 = x^25*)

  in 
    z*z

  end;
pow50(2.0);

(*Write a recursive funtion with pattern matching named linSearch that inputs a
* 2-tuple consists of an int liat and int. It will return the position number of
        the first occurence of the given int value on the list. Assume starting
        value is not found in the lst, then the funtions should return the
        length of the list + 1

        -linSearch([2,3,5,7],9);
        val it =4 : int
        -linSearch([2,3,5,7],9);
        val it = 5 : int
        *)
        
fun linSearch ([],_) = 1
  | linSearch (x::xs,y) = if x=y then 1 else 1+linSearch(xs,y);

linSearch([2,3,5,7],9);
linSearch([2,3,5,7],7);

(*
To "save" information in a programing language, we may only add an extra
argument to a funtion to "hold" the needed data unti; it is used


Ex Repeast last example, except it should return -1 if the int value is not in
the list. (We're going to add a backend funtion to handle recursion and to save length
of the list)
*)

(*Back_End*)
fun helper ([],_,n) = ~n-1
  | helper (x::xs,y,n) = if x=y then 1 else 1+helper(xs,y,n); 

(*Front_End*)
fun linSearch2 (L,x) = helper(L,x,length(L));


linSearch2([2,3,5,7],7);
linSearch2([2,3,5,7],9);

(*
NEW RESERVED WORD: as 
Allows us ti use identifiers or parts of an identifier in expression by doing
additional bindings.
*)

(*
Ex. Write a recursive funtion using pattern matching with name and type
  sortedMerge: int list * int list -> int list
that inputs two sorted list integers and return a single combine sorted list.
For example,
  - sortedMerge([2,3,5,7],[4,5,6]);
val it = [2,3,4,5,6,7] :int list
*)

fun sortedMerge ([],B) = B
  |sortedMerge (A,[]) = A
  |sortedMerge (A as x::xs, B as y::ys) =
    if x<y then x::sortedMerge(xs,B) else y::sortedMerge(A,ys);

sortedMerge([2,3,5,7],[4,5,6]);

(*
Ex. (in-class) Write a recursive duntion that inputs a list ofb real and returns
their average. you can use let for temporary declaration or helper to save info.
For example,
  -avg([2.0,4.0,9.0]);
val it = .0 : real
*)
fun avgh [] = 0.0
  |avgh (x::xs) = x + avgh(xs);

fun avg [] = 0.0
  |avg (A) = avgh(A)/(real(length(A)));


avg [2.0,4.0,5.0,7.0];
avg[2.0,6.0];



