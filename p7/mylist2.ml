let hd = function 
[]-> raise (Failure "Lista vacía")
|h::_ -> h;;

let rec tl = function
[] -> raise (Failure "Lista vacía")
|_::t -> t;;

let length l =
  let rec aux l acum = match l with
    [] -> acum
    | h::t -> aux t (acum + 1)
  in aux l 0;;

let rec compare_lengths = function 
[] -> (function [] -> 0 | _ -> -1) 
| _::t1 -> (function [] -> 1 | h2::t2 -> compare_lengths t1 t2);;


let rec nth l n = 
if(n == 0) then hd l 
else if(n > 0) then nth (tl l)(n-1)
else if(n < 0) then raise (Invalid_argument "List.nth")
else raise (Failure "nth");;

let rec append l1 l2= match l1 with 
[] -> l2
| h::t ->  h::append t l2;;

let rec find p = function
  [] -> raise Not_found
| h::t -> if p h then h else find p t;;

let rec for_all f = function 
[]-> true 
| h::t -> f h && for_all f t;;

let rec exists x = function
 [] -> false 
| h::t -> if x h then true else exists x t;; 

let rec mem x = function
 [] -> false 
 | h::t -> x = h || mem x t;;

let rev l =
  let rec aux v = function
    [] -> v
    | h::t -> aux (h::v) t
  in aux [] l;;
  
let rec filter f l =
  let rec aux f l auxl = match l with
    [] -> auxl
    | h::t -> if f h
      then aux f t (h::auxl)
      else aux f t auxl
    in aux f (rev l) [];;

let  find_all = filter;;


let partition f l = (filter f l), (filter (function 
x->not(f x))l);;

let rec split  = function
 []->[],[]
 | (a,b)::t-> let t1,t2 = split t in a::t1,b::t2;;

let rec combine l1 l2 =
 match (l1,l2) with
  [], [] -> []
  | h1::t1, h2::t2 -> (h1,h2) :: (combine (t1) (t2))
  | _ -> raise (Invalid_argument "combine");;

let init n f =
  if n < 0
    then raise (Invalid_argument"len < 0")
    else let rec aux (i, l) =
      if i = n then l else aux(i + 1, f i::l)
    in rev(aux(0, []));;
  
let rec rev_append l1 l2 = match l1 with 
[] -> l2 
| h::t -> rev_append t (h::l2);;
 
let rec concat   = function
 []-> []
| h::t -> h@concat t;;

let flatten = concat;; 

let rec map x = function 
[] -> []
| h::t ->  x h::map x t;;


let rev_map f l =
  let rec aux l auxl = match l with
    [] -> auxl
    | h::t -> aux t (f(h)::auxl)
  in aux l [];;

let rec map2 f l1 l2 = match (l1,l2) with
| [],[] -> []
| h1::t1,h2::t2 -> (f h1 h2)::(map2 f t1 t2)
| _ -> raise (Invalid_argument "List.map2");;

let rec fold_left op e = function  
[] -> e 
| h::t -> fold_left op (op e h) t;;

let rec fold_right op l e = match l with 
[]-> e 
| h::t -> op h (fold_right op t e);;
