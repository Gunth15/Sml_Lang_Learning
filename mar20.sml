(*
Continue lecture 1-3 
*)

chr(97);
chr;


(*
Ex. Write a function named apply that inputs a function andvalue as a tuple, and
then returns  the inpiut function applied to the value
*)
fun apply (f,a) = f(a)
fun g x= x+1;
fun h x = 3*x;

apply(g,7); 
apply(g,10);
apply(h,7);
apply(chr,97);

fun f1 x = x^"jason";
fun f2 x = x;

f1("jason");
f2(#"a");

fun f3 () = ();
fun f4 () = [];

fun f6 (x,y,z) = (y,z,x);
fun f7 (_,_,z) = (z,z,z,z);

f6;
f7;

(* The wildcard in ML is _ *)

(*
In functional prograsmming language, global variable are frowned upon
*)

val k = 4;
fun f8 y = y+k;
val k = 20;
f8(3);

(*
Anonymous functions aka functionised defined on the fly aka functions without a
name can be created with the syntax
  fn <parameters> => <expression>
*)

fn x => x+1;
it(8);


apply(fn x=> x*x, 10);

(*
Ex. write a funtcion named getFun that inputs a number c and then return a function 
f(x) = cx
*)

fun getFun c = fn x => c*x; 

val f9 = getFun(69);

f9(10);


(*Ex. (in-class) Write a function that inputs a string s and then returnss the
 functiona that concatenates its input string w to return was. Name the
 function suffix. For exampl,
  - val pastFun = suffix("ed");
  <??>
  -pastFun("box");
  val it = "boxed" : string

  ex. Write a function that inputs a booleans p and then returns the
  boolean function xor(q) = p xor q. Name it getFun3.
      -val f10 = getFun(True);
      <??>
      - f10(false);
      val it = true: bool

  Ex. (in-class) write a functiopn inputa  a boolean b. If b is true, it returns
  the funtion f(x,y) = x+y. If b is false, it retunrns the function f(x,y) = xy.
  Name it getFun4
 *)

fun getFun3 p = 
  if p then 
    fn q => p andalso not(q) 
  else 
    fn q => p orelse q    

fun getFun4 b = 
  if b then 
    fn (x,y) => x+y 
  else 
    fn (x,y) => x*y;

