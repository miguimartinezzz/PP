let to0from n = let rec aux acc i =
    if i>n then acc
    else aux (i::acc) (i+1) in
  aux [] 0;;

let fromto m n = let rec aux acc i =
    if m>n then []
    else if i=m then i::acc
    else aux (i::acc) (i-1) in
  aux [] n;;

let from1to n = let rec aux acc i =
                   if n<1 then []
                   else if i=1 then i::acc
                   else aux (i::acc) (i-1) in
  aux [] n;;

let map f lst = let rec aux acc = function
      [] -> acc
    |h::t -> aux ((f h)::acc) t in
  aux [] (List.rev lst);;

let power x y = let rec aux acc i =
                  if i=y then x*acc
                  else aux (x*acc) (i+1) in
  if y<0 then raise (Invalid_argument "power")
  else if y=0 then 1
  else aux 1 1;;

let incseg lst = let rec aux accl accn = function
      [] -> accl
    |h::t -> aux ((h+accn)::accl) (h+accn) t in
  List.rev (aux [] 0 lst);;

let remove x lst = let rec aux lno = function
      [] -> lno
    |h::t -> if (x=h) then List.rev_append lno t
      else aux (h::lno) t in
  aux [] lst;;

let rec divide = function lst ->
  let rec impares a = function 
  [] -> List.rev(a)
  |h1::[] -> List.rev(h1::a)
  | h1::h2::t -> impares (h1::a) t in
  let rec pares = function [] -> [] | h1::l -> impares [] l
  in (impares [] lst, pares lst);; 

let rec compress = function l -> 
    let rec aux a = function 
    [] -> List.rev(a)
    | h1::[] -> List.rev(h1::a)
    | h1::h2::t -> if h1 = h2 then aux a (h2::t)
    else aux (h1::a) (h2::t) in aux [] l;;