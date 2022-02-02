
let to0from n = 
	let rec aux l i =
		if i < 0 then List.rev l
		else aux (i::l) (i - 1)
	in aux [] n;;
	
let fromto m n = 
	let rec aux l i =
		if i < m then l
		else aux (i::l) (i - 1)
	in aux [] n;;

let from1to n = 
	let rec aux l i =
		if i < 1 then l
		else aux (i::l) (i - 1)
	in aux [] n;;

let map f l =
	let rec aux f l acc = match l with
		[] -> List.rev acc
		| h::t -> aux f t ((f h)::acc)		
	in aux f l [];;

let power x y =
	let rec innerpower x y acc =
		if y = 0 then acc
		else innerpower x (y - 1) (x * acc)
	in
	if y >= 0 then innerpower x y 1
	else invalid_arg "power";;

let incseg l = 
	let rec aux l acc l2 = match l with
		[] -> []
		| [h] -> List.rev ((h + acc)::l2)
		| h::t -> aux t (h + acc) ((h + acc)::l2)
	in aux l 0 [];;
	

let rec remove x l = let rec aux acc = function
    [] -> l
    |h::t -> if x = h then List.rev_append acc t
             else aux (h::acc) t 
  in aux [] l ;;
