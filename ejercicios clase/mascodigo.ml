let div x y =
   if y=0 then None
   else Some(x/y);;
(*EJEMPLO SOME*)
let div x y = 
   try Some(x/y) with Division_by_zero -> None 
;;
let hd'=
   try Some(List.hd l) with Failure _-> None;;
   
type nat = 0 | S of nat;;

let rec sum m n = match m with 
   0->n
 | S m'-> sum m'(S n);;
 
PARA HACER ARBOLES
type 'a quiza=
     Nada
   | Algo of 'a;;
   
type 'a tree =
        V
      | N of 'a * 'a tree * 'a tree ;;
      
let h x= N(x,V,V);

let rec nnodos = function 
    V -> 0
  | N(_,i,d) -> 1+nnodos i + nnodos d;;
  
let rec altura = function 
    V -> 0
  | N(r,i,d) -> 1+ max(altura i)(altura d);;

let rec preorden = function 
    V -> []
  | N(r,i,d) -> r::preorden i @ preorden d;;
  
let rec postorden = function 
    V -> []
  | N(r,i,d) -> (*definir*)
  
let rec inorden = function 
    V -> []
  | N(r,i,d) -> (*definir*)
