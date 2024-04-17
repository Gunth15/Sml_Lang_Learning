(*
Lecture 1-6: Ml Input and Output

We will learn how to read and write to files so that ML can communicate with
the outside world. Warning: Sometimes using VSCode with Ml can cause unintended
results. First, there is a built0in function to load files into the interpeter
via terminal. The function is
  use: string -> unit

There is a built-in funtion to print strings to the terminal
  print: string -> unit
*)
val x = 42;
print "hello world\n";


(*
Ex. write an Ml funtion with the name and type 
  pchar: char -> unit
that inputs a chracter, prints the character to the terminal, then returns unit.

*)
fun pchar c = print(str(c)^"\n"); 

(*
Structures
an ML structure is a built-in "library"
that contains predifined functions that we can import into ML stack


The syntax to load all of a structure funtion onto a stack is 
  open <structure name>


NEW CONSTRUCT
  <exp1>; <exp2>; <...>; <expn>
Evaluates several expr consecutively. Afterward, the final result Evaluates to
the last expression


Ex. Write an ML recursive funtion with the pattern matching with name and type
  pbools : bool -> list -> unit
that will input list of bools, print them to the
  -pbools [true,true,false];
  true
  true
  false
val it = () : unit
*)
fun pbools [] = ()
  |pbools (x::xs) = (
    print(Bool.toString(x)^"\n");
    pbools(xs)
  );
  (*
  Note: This construct can be use for debugging! Yous can display intermediate
  variable values. just remeber last expresion must be right type


  FILE READING
  
  NEW STRUCTURE:TextIO
  NEW TYPE: instream

  NEW LIBRARY FUNCTIONS
    TextIO.openIN : string -> instream
      Takes file name as a string and returns a reference to access the file.

    TextIO.closeIN : instream -> unit
      Closes file that was used for reading 
      and returns unit

    TextIO.endofStream : instream -> bool
      Check whether you've reached the end of the file

    TextIO.input : instream -> string (* aka vector *)
      Read/consumes the entirte file and returns as a string.

    TextIOinputN : instream * int -> string 
      Inputs a file and non-negative integer and reads that number of chracters
      from the file and returns thems as a string

    TextIo.inputline: instream -> string option    
      Reads and consumes from the file one line at a time and returns as a
      string option. 

    TextIO.input1 : instream -> char(aka elem) option
      Reads and consumes form the file 1 char at time and returns as char
      option.

    TextIO.lookahead : instream -> char option
      Reads next character in file but does not consume and returns char option

    FILE WRITING
    NEW TYPE: outstream

    NEW LIBRARY FUNCTIONS
      TetxIO.openOUT: string -> outstream
        Open file for writing 

      TextIO.openAppend : string -> outstream
        Open a file for appending 

      TextIO.closeOut  outstream -> unit
        Close a file that was used for writing and returns a void

      TextIO.output : outstream * string -> unit
        Write string to output file and return unit

      TextIO.stdIn : instream
      TextIO.stdOut : outstream
  *)
  
