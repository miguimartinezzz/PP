let hd (h::_) = h;;

let tl (_::t) = t;;

let rec length = function
 [] -> 0 
 | _::t -> 1 + length t;;

let rec compare_lengths = function 
[] -> (function [] -> 0 | _ -> -1) 
| _::t1 -> (function [] -> 1 | h2::t2 -> compare_lengths t1 t2);;


let rec nth l x =  match l with 
[] ->  raise (Failure "corto")
| h::t -> if x=0 then h else nth t (x-1);;

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

let rec filter x = function
 [] -> []
| h::t-> if x h then h::filter x t else filter x t ;;

let  find_all = filter;;

(*let rec partition x = function
 [] -> []
| h::t-> if x h then h::partition x t else t::partition x t ;;*)

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
  let rec init' i n f =
    if i >= n then []
    else (f i) :: (init' (i+1) n f)
  in init' 0 n f;;
  
let rec rev  = function 
[] -> []
| h::t -> append(rev t) [h];;

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

let  rev_map x =  
let rec rev_map_aux x acc = function
[] -> acc
| h::t ->  rev_map_aux x (x h::acc) t in rev_map_aux x [];;

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
