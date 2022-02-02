ENTRADA Y SALIDA

input_char ;;

open_in ;;

let f= open_in "prueba";; (*ABRE EL ARCHIVO PRUEBA,SOLO SI EXISTE*)

input_line ;;

close_in;; (*cierra el canal*)

let read_line = input_line stdin;;

output_string_list : out_channel -> string list -> unit

let rec output_string_list s = function 
    []-> ()
  | h::t -> output_string s (h ^"\n");
         output_string_list s t;;
         
input_string_list: in_channel -> string list;;

let rec input_string_list f=
    try input_line f :: input_string_list f 
    with End_of_file -> [];;
    
ref 7;; (*crea una variable que guarda el valor 7*)

let pato= ref 7;; (* la variable pato vale 7*)
