false && (2 /0 > 0);;
(*- : bool = false*);;
(*true && (2/0 > 0);;*);;
(*Error de ejecucion, no se puede dividir por 0*);;
true || (2/0 > 0);;
(*- : bool = true*);;
(*false || (2/0 >0);;*);;
(*Error de ejecucion, no se puede dividir por 0*);;
let con b1 b2 = b1 && b2;;
(*val con : bool -> bool -> bool = <fun>*);;
let dis b1 b2 = b1 || b2;;
(*val dis : bool -> bool -> bool = <fun>*);;
(*con (1<0) (2/0 >0);;*);;
(*Error de ejecucion, no se puede dividir por 0*);;
(1<0) && (2/0 >0);;
(*- : bool = false*);;
(*dis (1>0) (2/0 >0);;*);;
(*Error de ejecucion, no se puede dividir por 0*);;
(1>0) || (2/0 >0);;
(*- : bool = true*);;



