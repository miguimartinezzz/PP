let esValido fil col (x,y)=
  x >= 1 && x <= fil && y >= 1 && y <= col;; 

let not_mem l e =
  not(List.mem e l);; 

let rec compare_lengths list1 list2 = match (list1,list2) with
	[],[] -> 0
	| _,[] -> 1
	| [], _ -> -1		
	| _::t1, _::t2 -> compare_lengths t1 t2;;  
                                                                                  
let next (i,j) =
    List.map (fun (x,y)->(i+x,j+y)) [(1,2);(1,-2);(-1,2);(-1,-2);(2,1);(2,-1);(-2,1);(-2,-1)];;

let rec esFinal c =function
    []->(-1,-1)
    |h::t->if h = c then h else esFinal c t;;

let tourAll m n inicio fin =
    let rec aux camino (i,j) = 
        if (i>m)||(i<1) ||(j>n) ||(j<1) then []
        else
            if (i,j) = fin && not_mem camino (i,j) then [List.rev ((i,j)::camino)]
            else
            if not_mem camino (i,j) then
                let jump = next (i,j) in
                    match esFinal fin jump with
                        (-1,-1)-> let rec aux2 saltos= match(List.tl saltos) with
                                    []->aux((i,j)::camino) (List.hd saltos)
                                    |_->aux((i,j)::camino) (List.hd saltos) @ aux2(List.tl saltos)
                                in aux2 jump
                        | sol -> aux ((i,j)::camino) sol

          else []
        in aux [] inicio;;

let escogerMenor lista = match lista with
    []->raise(Invalid_argument"No hay lista")
    |h::[]->h
    |h::t-> let rec aux lista a = match (lista) with
        []->a
        |h::t-> match compare_lengths h a with
                1|0->aux t a
                |_->aux t h
        in aux t h;;                                 

let shortest_tour m n inicio fin = escogerMenor(tourAll m n inicio fin);;