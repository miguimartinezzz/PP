let rec fib n =
if n <= 1 then n
else fib (n-1) + fib (n-2);;

let rec print x =
if x =0 then (print_int(fib(x)); print_endline "")
else (print(x-1); print_int(fib (x)) ; print_endline "");;

print (int_of_string(Sys.argv.(1)));;
