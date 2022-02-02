type 'a tree =
     V
   | N of  'a * 'a tree * 'a tree;;

type 'a sttree =
    Leaf of 'a
  | Node of 'a * 'a sttree * 'a sttree;;
  
let rec nnodos = function 
    Leaf _ -> 1
  | Node(_,i,d) -> 1 + nnodos i + nnodos d;;

let rec hojas = function 
    Leaf x -> [x]
  | Node(_,i,d) -> hojas i @ hojas d;;  
  
let rec nnodos = function 
    Leaf x -> Leaf x 
  | Node(r,i,d) -> Node(r,mirror d,mirror i);;
  
type 'a gtree =
    Gt of 'a * 'a gtree list;;
    
let h x = Gt(x,[]);;

let d = Gt(5,[Gt(9,[h 4])]);;

let rec nnodos = function 
    Gt(_,[]) -> 1
  | Gt(r,l) -> 1 + List.fold_left (+) 0 (List.map nodos l);;
    
let rec nnodos = function 
    Gt(r,l) -> 1 + List.fold_left (+) 1 (List.map nodos l);;
    
let rec nnodos = function 
    Gt(_,[]) -> 1
  | Gt(r,h::t) -> nnodos h + nnodos(Gt(r,t));;
  
(*out_channel*)->dispositivo donde se puede escribir;;

let print_char c = output_char stdout c;;

let output_string sal s =
    let n = String.length s in 
    let rec loop i =
        if i >= n then ()
        else output_char sal s.[i]
    in loop 0;;
