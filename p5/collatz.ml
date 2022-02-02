let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;
let rec orbit n =
  if n <=1 then print_endline("1")
  else (
  print_int(n);
  Printf.printf(",");
  orbit(f n));;
  
let rec length n =
  if n <=1 then 1
  else  1+length(f n);;
  
let rec top n =
 if n <= 2 then n
 else max n(top(f n));;
 
let rec length'n'top n=
  if n <= 1 then 1,n
  else length n,top n;;
 

