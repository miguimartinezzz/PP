let fact n=
    let f= ref 1 in
    for i= n downto 1 do
        f:=!f*i
    done;
    !f;;
    
let fact n=
    let f = ref 1 in 
    let i = ref 1 in
    while !i <= n do
       f:= !f *!i;
       i:= !i+ 1
    done;
    !f;;
    
    
v.(1) <- 1000;; (*GUARDAR EN LA POS 1 EL VALOR 1OOO*)

