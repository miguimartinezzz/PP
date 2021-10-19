

LISTAS

# let l = ['a';'e';'i';'o';'u'];;
val l : char list = ['a'; 'e'; 'i'; 'o'; 'u']
# List.hd l;;
- : char = 'a'
# List.tl l;;
- : char list = ['e'; 'i'; 'o'; 'u']

(*definir operacion ultima posicion*)
 (*a last; 'a list ->'a *)
 
 let rec last l= 
   if List.tl l=[] then List.hd l
   else last (List.tl l);;
   
(*exn :=exception, marca los errores, tdos tienen este tipo *)
(*List.append == @*)
# [1;2;3] @ [213;42];;    
- : int list = [1; 2; 3; 213; 42]
# List.rev l;;
- : char list = ['u'; 'o'; 'i'; 'e'; 'a']
# List.nth l;;
- : int -> char = <fun>
# List.nth l 2;;
- : char = 'i'
(* List.map le da una funcion y una lista de cosas a las que se puede aplicar *)
(*List.filter devuelve los valores que cumplen el predicado*)
#List.filter (function n -> n mod 2 =0)[0;1;2;3;4;5;6];;
(*List.mem devuelve si un elemento es miembro de la lista *) 
(* List.exists, mezcla entre mem y filter *)
 # List.for_all (function n -> n mod 2 = 0)[2;4;6] ;;
- : bool = true
# List.find (function n -> n mod 2 =0)[1;3;4;6;8];;
- : int = 4
# List.init 10 float ;;
- : float list = [0.; 1.; 2.; 3.; 4.; 5.; 6.; 7.; 8.; 9.]
 
 (*PROVOCAR ERRORES *)
 # raise Division_by_zero ;;
Exception: Division_by_zero.
# Failure "hd" ;;
- : exn = Failure "hd"
# raise (Failure "CIAO") ;;
Exception: Failure "CIAO".# raise Division_by_zero ;;
Exception: Division_by_zero.
# Failure "hd" ;;
- : exn = Failure "hd"
# raise (Failure "CIAO") ;;
Exception: Failure "CIAO".


NUEVA MANERA DEFINIR LISTAS
# 1::(2::(3::(4::[])));;
- : int list = [1; 2; 3; 4]
# 1::2::3::4::[];;
- : int list = [1; 2; 3; 4]
# let l = ['a';'e';'i';'o';'u'];;
val l : char list = ['a'; 'e'; 'i'; 'o'; 'u']
# let h :: t = l;;
Warning 8: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
[]
val h : char = 'a'
val t : char list = ['e'; 'i'; 'o'; 'u']
# let x::y = t;;
Warning 8: this pattern-matching is not exhaustive.
Here is an example of a case that is not matched:
[]
val x : char = 'e'
val y : char list = ['i'; 'o'; 'u']

# compare;;
- : 'a -> 'a -> int = <fun>
# compare 4 5;;
- : int = -1
# compare 4 4;;
- : int = 0

(*List.compare_length compara longitud listas *)
 OTRA DEFINICION
 # let compare_lengths l1 l2=
  compare(length l1)(length l2);;

let rec mem x l = match l with 
    [] -> false 
  | h::t -> x= h || mem x t ;;

let rec quo x y =
  if x<y then 0 
  else 1+quo(x-y) y ;; //puede dar stack overflow
  
  
let rec length = function 
  [] -> 0
| _::t -> 1+length t;;

let rec suma_length i = function 
   [] ->i
 | _::t -> suma_length (i+t) t;;
 
  

  





