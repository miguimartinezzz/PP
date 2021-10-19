let rec fact = function x -> if x = 0 then 1 else x * fact (x-1);;
let argc = Array.length Sys.argv;;
let x = if argc == 2 then int_of_string Sys.argv.(1) else 0;;
if x == 0 then print_endline("fact: número de argumentos inválido") else  print_endline(Printf.sprintf"%d" (fact x));;
