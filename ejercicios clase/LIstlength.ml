let rec length l=
  if l=[] then 0
  else 1+length(List.tl l);;
