let rec mcd (x,y) = if y > 0 then mcd (y,(x mod y)) else x;;
