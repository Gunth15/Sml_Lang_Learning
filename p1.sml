(*
Name: Cameron White
Email: cjw041@email.latech.edu
Date: 5/30/24
CSC 330 001
Quarter: 243
Project #1
*)

datatype token = INT | MAI | RET | OP | CP | OB | CB | SC | IN of int| EOF;
(*finds key words*)
fun filter [] = EOF::[] 
|filter((#" ")::xs) = filter(xs)
|filter((#"(")::xs) = OP::filter(xs)
|filter((#")")::xs) = CP::filter(xs)
|filter((#"{")::xs) = OB::filter(xs)
|filter((#"}")::xs) = CB::filter(xs)
|filter((#";")::xs) = SC::filter(xs)
|filter((#"i")::(#"n")::(#"t")::(#" ")::xs) = INT::filter(xs)
|filter((#"m")::(#"a")::(#"i")::(#"n")::xs) = MAI::filter(xs)
|filter((#"r")::(#"e")::(#"t")::(#"u")::(#"r")::(#"n")::xs) = RET::returncase(xs)
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
(*quirky return*)
returncase ((#" ")::xs) = filter(xs)
|returncase((#"(")::xs) = OP::filter(xs)
|returncase((#")")::xs) = CP::filter(xs)
|returncase((#"{")::xs) = OB::filter(xs)
|returncase((#"}")::xs) = CB::filter(xs)
|returncase((#";")::xs) = SC::filter(xs)
|returncase(_) = []
and
(*find integers*)
isnum(NONE,_) = []
|isnum(SOME(x),xs) = IN(x)::filter(xs);

(*checks if funtion is valid*)
(**fun isvalid()*)

(*get next line*)
fun getLn (NONE,F) = []
|getLn(SOME(l),F) = filter(explode(l))@getLn(TextIO.inputLine(F),F); 
(*entry point ans parser*)
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
