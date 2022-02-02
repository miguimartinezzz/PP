(*Ejercicio 2*)
(*Fusión*)

(*1*)

let rec divide l = match l with
     h1::h2::t -> let t1, t2 = divide t in (h1::t1, h2::t2)
    |_ -> l, [];;


let rec merge  ord = function
    [], l | l, [] -> l
    | h1::t1, h2::t2 -> if ord h1 h2 then h1 :: merge ord (t1, h2::t2)
                        else h2 :: merge ord (h1::t1, t2);;


let rec msort1 ord  l = match l with
    [] | _::[] -> l
    | _ -> let l1, l2 = divide l in
    merge ord (msort1 ord l1, msort1 ord l2);;


(*¿Puede provocar algún problema la no terminalidad de divide o merge? En caso afirmativo,
defina un valor l2 : int list que sea un ejemplo de ello. En caso negativo, defina l2 como
la lista vacı́a.*)

let l2 = List.init 1_000_000 (function _ -> Random.int 1_000_000 );;

(*Si, en los casos donde la lista sea muy grande puede dar stack overflow 
# msort1 (<) l2;;
Stack overflow during evaluation (looping recursion?).*)


(*2*)

let merge' a = function [], l | l, [] -> l
        | h1::t1, h2::t2 -> let rec aux a ll b = match ll with [], l | l, [] ->  List.rev_append (List.rev l) b
            | h1::t1, h2::t2 -> if a h1 h2 then aux a (t1, h2::t2) (h1::b)
                                else aux a (h1::t1, t2) (h2::b)
         in List.rev(aux a (h1::t1, h2::t2) []);;


let rec divide' l = 
    let rec aux part1 part2 = function
          [] -> (List.rev part1, List.rev part2)
        | [x] -> (List.rev (x::part1), List.rev part2)
        | h::t -> aux (h::part1) (List.hd t::part2) (List.tl t)
          in aux [] [] l;;


let rec msort2 f l = match l with
      [] | _::[] -> l
    | _-> let l1, l2 = divide' l in
        merge' f (msort2 f l1, msort2 f l2);;


let rec qsort2 ord =
    let append' l1 l2 = List.rev_append (List.rev l1) l2 in
    function
    [] -> []
    | h::t -> let after, before = List.partition (ord h) t in
    append'  (qsort2 ord before) (h :: qsort2 ord after);;
    

(*Compare el rendimiento en tiempo de ejecución de msort2 con el de msort1 y
 con el de qsort2.*)


(*Vamos a comparar el rendimiento mediante listas ordenadas y listas desordenadas,
para ello definimos crono *)
let crono f x =
    let t = Sys.time () in 
    f x; Sys.time () -. t ;;

(*Ordenadas*)
(*crono (msort2 (>)) (List.init 1_000 abs);;*)
(*float = 0.00421200000000004904*)
(*crono (msort1 (>)) (List.init 1_000 abs);;*)
(*float = 0.00177699999999997305*)
(*crono (qsort2 (>)) (List.init 1_000 abs);;*)
(*float = 0.0697309999999999874*)

(*Esto se debe al numero de caminos y funciones internas tiene que llamar 
el msort1 es mas rapido ya que solo llama a divide y merge en las cuales no tiene ninguna implementacion
de una funcion interna como list.rev o list.rev_append*)


(*Desordenadas*)
(*crono (msort2 (>)) l2;;*)
(*float = 3.23683799999999966*)
(*crono (msort1 (>)) l2;; *)
(*Stack overflow during evaluation (looping recursion?).*)
(*crono (qsort2 (>)) l2;; *)
(*float = 2.91415199999999963*)

(*Esto se debe a que msort1 hace n^2 pasos segundo el numero de elemetos n , mientras que msort 2 y qsort2 
hacen n * log en base dos de n *)






