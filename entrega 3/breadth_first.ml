open G_tree;;
 
(*Versión no terminal de breadth_first*)

let rec breadth_first = function 
   Gt (x, []) -> [x]
  |Gt (x, (Gt (y, t2))::t1) -> x :: breadth_first (Gt (y, t1@t2));;

(*Versión terminal de breadth_first*)

let breadth_first_t arbol =
  let rec aux acc = function
      Gt (x, []) -> List.rev (x::acc)
    | Gt (x, Gt(raiz, ramas)::lista) ->
      aux (x::acc) (Gt(raiz, List.rev_append (List.rev lista) ramas))
  in
  aux [] arbol;;
  
    
let leaf v = Gt(v,[]);;


let id x = x;;


let init_tree n = Gt(n, List.rev_map leaf (List.init n id));;


let t = init_tree 30_000;;

