 let rec length = function 
  [] -> 0
  | _ :: t -> 1+length t;;

let rec last = function 
   h::[] -> h
 | _::t -> last t
 | [] -> raise (Failure "LAST");;
 
let rec append = function
   []-> (function l -> l)
 | h::t -> (function l -> h:: append t l);;
 
let rec append l1 l2 = match l1 with 
   [] -> l2
 | h::t -> h:: append t l2 ;; 
