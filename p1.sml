datatype token = INT | MAI | RET | OP | CP | OB | CB | SC | IN of int;

(*finds key words*)
fun filter [] = [] 
|filter((#" ")::xs) = filter(xs)
|filter((#"(")::xs) = OP::filter(xs)
|filter((#")")::xs) = CP::filter(xs)
|filter((#"{")::xs) = OB::filter(xs)
|filter((#"}")::xs) = CP::filter(xs)
|filter((#";")::xs) = SC::filter(xs)
|filter((#"i")::(#"n")::(#"t")::(#" ")::xs) = INT::filter(xs)
|filter((#"m")::(#"a")::(#"i")::(#"n")::xs) = MAI::filter(xs)
|filter((#"r")::(#"e")::(#"t")::(#"u")::(#"r")::(#"n")::xs) = RET::filter(xs)
|filter(x::xs) = wordp([x],xs)
and
(*parse values*)
wordp(W,[]) = []
|wordp(W,(#" ")::xs) = isnum(Int.fromString(implode(rev(W))),xs)
|wordp(W,(#";")::xs) = isnum(Int.fromString(implode(rev(W))),(#";")::xs)
|wordp(W,(#")")::xs) = isnum(Int.fromString(implode(rev(W))),(#")")::xs)
|wordp(W,(#"}")::xs) = isnum(Int.fromString(implode(rev(W))),(#"}")::xs)
|wordp(W,x::xs) =  wordp(x::W,xs)
and
(*find integers*)
isnum(NONE,_) = []
|isnum(SOME(x),xs) = IN(x)::filter(xs);

fun getLn (NONE,F) = []
|getLn(SOME(l),F) = filter(explode(l))@getLn(TextIO.inputLine(F),F); 

fun parse x =
let 
  val F = TextIO.openIn(x)
  val tokens = getLn(TextIO.inputLine(F),F) 
  val _ = TextIO.closeIn(F)
in
  tokens   
end;

parse("test1.txt");
parse("test2.txt");
parse("test3.txt");
parse("test4.txt");
