let rec divide = function
   h1::h2::t -> let t1,t2 = divide t in 
                h1::t1,h2::t2
  | l -> l,[];;
  
let rec merge l1 l2 = match l1,l2 with 
   [],l | l,[] -> l
 | h1::t1,h2::t2 -> if h1<= h2 then h1::merge t1 l2 
                    else h2::merge l1 t2;;
                    
let rec m_sort = function 
    [] -> []
  | l -> let l1,l2 = divide l in 
         merge (m_sort l1)(m_sort l2)  
