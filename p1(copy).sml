(*
Name: Cameron White
Email: cjw041@email.latech.edu
Date: 5/30/24
CSC 330 001
Quarter: 243
Project #1
*)

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
|filter((#"r")::(#"e")::(#"t")::(#"u")::(#"r")::(#"n")::xs) = RET::returncase(xs)
|filter(x::xs) = wordp([x],xs)
and
(*quirky return cases*)
returncase ((#" ")::xs) = filter(xs)
|returncase((#"(")::xs) = OP::filter(xs)
|returncase((#")")::xs) = CP::filter(xs)
|returncase((#"{")::xs) = OB::filter(xs)
|returncase((#"}")::xs) = CB::filter(xs)
|returncase((#";")::xs) = SC::filter(xs)
|returncase(_) = []
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

(*****************************************************)
(*verify only versions of the previous functions*)
fun vfilter [] = true 
|vfilter((#" ")::xs) = vfilter(xs)
|vfilter((#"(")::xs) = vfilter(xs)
|vfilter((#")")::xs) = vfilter(xs)
|vfilter((#"{")::xs) = vfilter(xs)
|vfilter((#"}")::xs) = vfilter(xs)
|vfilter((#";")::xs) = vfilter(xs)
|vfilter((#"i")::(#"n")::(#"t")::(#" ")::xs) = vfilter(xs)
|vfilter((#"m")::(#"a")::(#"i")::(#"n")::xs) = vfilter(xs)
|vfilter((#"r")::(#"e")::(#"t")::(#"u")::(#"r")::(#"n")::xs) = vreturncase(xs)
|vfilter(x::xs) = vwordp([x],xs)
and
vwordp(W,[]) = true
|vwordp(W,(#" ")::xs) = visnum(Int.fromString(implode(rev(W))),xs)
|vwordp(W,(#";")::xs) = visnum(Int.fromString(implode(rev(W))),(#";")::xs)
|vwordp(W,(#")")::xs) = visnum(Int.fromString(implode(rev(W))),(#")")::xs)
|vwordp(W,(#"}")::xs) = visnum(Int.fromString(implode(rev(W))),(#"}")::xs)
|vwordp(W,x::xs) = vwordp(x::W,xs)
and
vreturncase ((#" ")::xs) = vfilter(xs)
|vreturncase((#"(")::xs) = vfilter(xs)
|vreturncase((#")")::xs) = vfilter(xs)
|vreturncase((#"{")::xs) = vfilter(xs)
|vreturncase((#"}")::xs) = vfilter(xs)
|vreturncase((#";")::xs) = vfilter(xs)
|vreturncase(_) = false
and
visnum(NONE,_) = false
|visnum(SOME(x),xs) = vfilter(xs);
(*********************************************************************************)


(*get next line*)
fun getLn (NONE,F) = []
|getLn(SOME(l),F) = if vfilter(explode(l)) then
  filter(explode(l))@getLn(TextIO.inputLine(F),F) else (print("PARCE ERROR! "); []); 

(*entry point of parser*)
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
