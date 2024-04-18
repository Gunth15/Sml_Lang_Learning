datatype token = INT | MAI | RET | OP | CP | OB | CB | SC | IN of int;

fun filter (cv,#" ") = [] 
|filter(cv,#"(") = []
|filter(cv,#")") = []
|filter(cv,#"{") = []
|filter(cv,#"}") = []
|filter(cv,#";") = []
|filter(#"(",acc) = "(" 
|filter(#")",acc) = ")"
|filter(#"{",acc) = "{"
|filter(#"}",acc) = "}"
|filter(#";",acc) = ";"
|filter(cv,acc) = implode(cv::acc);

fun getLn (_,F) = getln(TextIO.inputline(F),F)
|getLn(SOME(s),F) = foldr(filter,[],explode(s))::getln(TextIO.inputline(F),F); 

fun tokenize ("int"::xs) = INT
|tokenize("main"::xs) = MAI
|tokenize("return"::xs) = RET
|tokenize("("::xs) = OP
|tokenize(")"::xs) = CP
|tokenize("{"::xs) = OB
|tokenize("}"::xs) = CB
|tokenize(";"::xs) = SC
|tokenize()


fun parse

