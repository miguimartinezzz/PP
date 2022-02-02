let rec length l=
  if l=[] then 0
  else 1+length(List.tl l);;
  
(*RECURSIVIDAD TERMINAL*)
let length l=
 let rec aux s=
  []->s;
  _::t -> aux(s+1) t
 in aux 0 l;; 
