(*Ejercicio 1*)
(*Quicksort*)

let rec qsort1 ord = function
[] -> []
| h::t -> let after, before = List.partition (ord h) t in
qsort1 ord before @ h :: qsort1 ord after;;

let rec qsort2 ord =
let append' l1 l2 = List.rev_append (List.rev l1) l2 in
function
[] -> []
| h::t -> let after, before = List.partition (ord h) t in
append'  (qsort2 ord before) (h :: qsort2 ord after);;


(*let rlist = List.init 1_000_000 (function _ -> Random.int 1_000_000 ) ;;*) 

(*1. ¿En qué casos no será bueno el rendimiento de esta implementación?*)

(*En el caso de que se pida ordenar una lista grande y aleatoria/desordenada.
Esto se debe a que qsort1 no es terminal y no será capaz de ordenarlo 
(ya que va acumulando operaciones) devolviendo un Stack overflow *)



(*2.¿Tiene qsort2 alguna ventaja sobre qsort1? ¿Permite qsort2 ordenar listas 
que no podrı́an ordenarse con qsort1? En caso afirmativo, 
defina un valor l1 : int list que sea ejemplo de ello. 
En caso negativo, defina l1 como la lista vacı́a.*)

(*Si, qsort2 es terminal. Si, qsort2 puede ordenar listas aleatorias de gran 
tamaño ya que es terminal mientras que qsort1 no es capaz 
let l1 = List.init 1_000_000 (function _ -> Random.int 1_000_000 ) -> este es 
un ejemplo de lista que qsort1 no podría ordenar*)

let l1 = List.init 1_000_000 (function _ -> Random.int 1_000_000 )



(*3.¿Tiene qsort2 alguna desventaja sobre qsort1? Compruebe si qsort2 es más lento que
qsort1. Si es ası́, explique por qué y estime la penalización, en porcentaje de tiempo
usado, de qsort2 respecto a qsort1.*)

let crono f x =
    let t = Sys.time () in 
    f x; Sys.time () -. t ;;

(*crono (qsort1 (<)) (List.init 100_000 (function _ -> Random.int 1_000_000 ))
- : float = 0.182068000000000119
crono (qsort2 (<)) (List.init 100_000 (function _ -> Random.int 1_000_000 ));;
- : float = 0.205484999999999918
*)
(*En cuanto a ordenación de listas más pequeñas (en las que qsort1 no da stackoverflow),
qsort1 es más rápido que qsort2. Qsort1 es más rápido porque solo recorre la lista 
una vez y luego hace un append no terminal, mientras que qsort2 recorre la 
lista dos veces pq primero hace List.rev y luego List.partition. Esto provoca que 
sea más lento ya que recorre dos veces la lista, y a su vez, como el append es
terminal (aunque la funcion es si no lo sea) hace que pueda ordenar listas muy 
grandes sin gran dificultad.*)


