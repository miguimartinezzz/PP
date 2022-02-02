let in_board n m (x,y)=
    x >= 1 && x <= m && y >= 1 && y <= n;;


let not_mem l e =
    not (List.mem e l);;


let legal_moves (x,y) m n visited =
    let moves = [(x-2, y+1);(x-1, y+2);(x+1, y+2);(x+2, y+1);
                 (x+2, y-1);(x+1, y-2);(x-1, y-2);(x-2, y-1)] in
                    List.filter (not_mem visited) (List.filter (in_board m n) moves);;


let tour m n start finish =
  let rec aux solution (x,y) moves = if finish = (x,y) then solution else match moves with
    |[] -> raise Not_found
    |start::t -> try aux (start::solution) start (legal_moves start m n solution)
    with
    Not_found -> aux solution (x,y) t
    in List.rev(aux [start] start (legal_moves start  m n [start]));;
