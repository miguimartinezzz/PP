type persona ={nombre : string; edad:int};;
let p1 =  {nombre = "Pepe"; edad = 55};;

type persona = {nombre : string;; mutable edad : int};;

let n = ref 0;
let turno ()= 
    n := !n +1;
    !n;;

let turno = function () ->
    let n = ref 0 in 
    n := !n +1;
    !n;;     (*define una nueva cada vez*)  
let turno() = 
    let n = ref 0 in 
    function () ->
             n:= !n +1; 
             !n;;  (*define una unica variable*)
