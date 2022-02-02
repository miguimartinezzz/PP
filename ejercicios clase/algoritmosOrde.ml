let rec sorted=function 
   h1::h2::t ->h1<=h2 && sorted(h2::t)
 | _->true;;
 
 (*ORDENACION POR SELECCIÓN*)
 let rec insert x = function 
    []->[x]
  | h::t -> if x<=h then x::h::t 
            else h::insert x t;;
            
            
let rec i_sort = function 
     []->[]
   | h::t -> insert h(i_sort t);;
