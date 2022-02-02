type 'a g_tree = Gt of 'a * 'a g_tree list;;

(*let h x = Gt (x, []);;
  -> árbol:
let a1 = Gt(6, [h 5; h 11]);;
let a2 = Gt(9, [h 4]);;
let a = Gt(2, [Gt(7, [h 2; h 10; a1]); Gt (5, [a2])]);;*)

(* devuelve el número de nodos de un g_tree *)
let rec size = function 
    Gt (_,[]) -> 1 
  | Gt (r,h::t) -> size h + size (Gt (r,t));; 

(* devuelve la "altura", como número de niveles, de un g_tree *)
let rec height = function
    Gt (_,[]) -> 1
  | Gt (r,h::t) -> max (1 + height h)  (height (Gt (r,t)));;

(* devuelve las hojas de un g_tree, "de izquierda a derecha" *)
let rec leaves = function
      Gt (r, []) -> [r]
    | Gt(r,[h]) -> leaves h 
    | Gt (r, h:: t) -> leaves h@(leaves (Gt(r,t)));;

  let rec leaves = function
      Gt (r, []) -> [r]
    | Gt (r, l) -> List.concat (List.map leaves l);;

(* devuelve la imagen especular de un g_tree *)
let rec mirror (Gt (r, l)) =
    Gt(r, List.rev(List.map mirror l));;

(* devuelve la lista de nodos de un g_tree en "preorden" *)
let rec preorder = function 
    Gt (r, []) -> [r]
  | Gt (r, Gt (r1, l1) :: t) -> r::preorder (Gt(r1, l1@t));;

let rec preorder = function 
  Gt (r, []) -> [r]
  |Gt (r, l) -> r::List.concat(List.map preorder l);;

(* devuelve la lista de nodos de un g_tree en "postorden" *)
let rec postorder = function 
    Gt (r, []) -> [r]
    |Gt (r, l) -> List.concat(List.map postorder l)@[r];;
