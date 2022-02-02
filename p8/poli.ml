let f x = x;;
(* No se pueden escribir más funciones de este tipo*) 
let h (x,y) = x ;;
(* No se pueden escribir más funciones de este tipo*) 
let i (x,y) = y;;
(* No se pueden escribir más funciones de este tipo*) 
let j x = [x];; 
(*Se pueden escribir más funciones de este tipo ya que en la lista puede aparecer una unica vez el valor, como en mi caso, o tantas veces como quieras. Un ejemplo de comprobación sería asi: let l = function n -> function x -> List.init n (function _ -> x);;*)
