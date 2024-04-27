datatype token = INT | MAI | RET | OP | CP | OB | CB | SC | IN of int;

fun filter [] = []
|filter(#" "::xs) = filter(xs)
|filter(#"("::xs) = "("::filter(xs)
|filter(#")"::xs) = ")"::filter(xs)
|filter(#"{"::xs) = "{"::filter(xs)
|filter(#"}"::xs) = "}"::filter(xs)
|filter(#";"::xs) = ";"::filter(xs)
|filter(x::xs) = implode(x::filter(xs));

(*
fun getLn (_,F) = getln(TextIO.inputline(F),F)
|getLn(SOME(s),F) = filter(explode(s))::getln(TextIO.inputline(F),F); 

fun tokenize [] = []
|tokenize("int"::xs) = INT::tokenize(xs)
|tokenize("main"::xs) = MAI::tokenize(xs)
|tokenize("return"::xs) = RET::tokenize(xs)
|tokenize("("::xs) = OP::tokenize(xs)
|tokenize(")"::xs) = CP::tokenize(xs)
|tokenize("{"::xs) = OB::tokenize(xs)
|tokenize("}"::xs) = CB::tokenize(xs)
|tokenize(";"::xs) = SC::tokenize(xs)
|tokenize(_::xs) = isnum()

fun isnum (SOME(Int.fromString(x) as T)::xs) = IN(T) 

fun parse
  *
zsh:1: command not found: xdd
