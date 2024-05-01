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
fun filter [] = [] 
|filter((#" ")::xs) = filter(xs)
|filter((#"(")::xs) = SOME(OP)::filter(xs)
|filter((#")")::xs) = SOME(CP)::filter(xs)
|filter((#"{")::xs) = SOME(OB)::filter(xs)
|filter((#"}")::xs) = SOME(CB)::filter(xs)
|filter((#";")::xs) = SOME(SC)::filter(xs)
|filter((#"i")::(#"n")::(#"t")::(#" ")::xs) = SOME(INT)::filter(xs)
|filter((#"m")::(#"a")::(#"i")::(#"n")::xs) = SOME(MAI)::filter(xs)
|filter((#"r")::(#"e")::(#"t")::(#"u")::(#"r")::(#"n")::xs) = SOME(RET)::returncase(xs)
|filter(x::xs) = wordp([x],xs)
and
(*parse values*)
wordp(W,[]) = isnum(Int.fromString(implode(rev(W))),[])
|wordp(W,(#" ")::xs) = isnum(Int.fromString(implode(W)),xs)
|wordp(W,(#";")::xs) = isnum(Int.fromString(implode(W)),(#";")::xs)
|wordp(W,(#")")::xs) = isnum(Int.fromString(implode(W)),(#")")::xs)
|wordp(W,(#"}")::xs) = isnum(Int.fromString(implode(W)),(#"}")::xs)
|wordp(W,x::xs) =  wordp(W@[x],xs)

and
(*quirky return*)
returncase ((#" ")::xs) = filter(xs)
|returncase((#"(")::xs) = SOME(OP)::filter(xs)
|returncase((#")")::xs) = SOME(CP)::filter(xs)
|returncase((#"{")::xs) = SOME(OB)::filter(xs)
|returncase((#"}")::xs) = SOME(CB)::filter(xs)
|returncase((#";")::xs) = SOME(SC)::filter(xs)
|returncase(_) = NONE::[]
and
(*find integers*)
isnum(NONE,_) = []
|isnum(SOME(x),xs) = SOME(IN(x))::filter(xs);


(*validates the all elemnts in list and unpacks*)
fun validate (y,[]) = y 
|validate(_,NONE::_) = (print("PARSE ERROR! "); [])
|validate(y,SOME(x)::xs) = validate(y@[x], xs);  

(*get next line*)
fun getLn (NONE,F) = []
|getLn(SOME(l),F) = filter(explode(l))@getLn(TextIO.inputLine(F),F); 

(*entry point for parser*)
fun parse x =
let 
  val F = TextIO.openIn(x)
  val tokens = validate([],getLn(TextIO.inputLine(F),F)) 
  val _ = TextIO.closeIn(F)
in
  tokens   
end;

parse("test1.txt");

parse("test2.txt");
(*
parse("test3.txt");
parse("test4.txt");
*)
