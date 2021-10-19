 let rec length = function 
  [] -> 0
  | _ :: t -> 1+length t;;

let rec last = function 
   h::[] -> h
 | _::t -> last t
 | [] -> raise (Failure "LAST");;
