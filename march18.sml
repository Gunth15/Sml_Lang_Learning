(*Lecture 1-3: ML Funtcions


Function declarations in ML have the syntax
   fun <identifier> <parameters> = <expression>
The type of this funtion when <parameters> has type T! and <expression> has type
        T2 is T1 -> T2
NOTE: fn is Ml's symbol for a function (whose details are hidden)
*)
fun spongebob x = x+1;
spongebob(48);
spongebob;
it(9);

(*
Ex. write a function with name/type
        rsquare: real -> real
that inputs a real number and returns its square value
*)

fun rsquare x:real = x*x;
rsquare(5.0);
(*
Note: you can use the : to associate a value with a type,but only do this when
necesary
NOTE: + and * are defaulted to int types
*)

(*
EX. (in-class) Write a function with name/type
 toUpper: char -> char
that inputs a lower case char and returns its uppercase version. Assume valid
     inputs. For example
        -toUpper(#"d");
        val it = #"D" : char
*)
fun toUpper x = chr(ord(x)-32);
toUpper(#"r");

(*
Ex. (in-class) write a function with name/type
  max# : int * int * int -> int
Thats inputs a 3-tuple of integers and returns the max value. For example
   -max3(2,9,5);
val it = 9:int
*)
