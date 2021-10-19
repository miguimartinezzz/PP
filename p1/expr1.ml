();; 
(* - : unit = () 
indica que es de tipo unit*)

2 + 5 *3;;
(* - : int = 17 *)

1.0;;
(* - : float = 1*)

(*1.0 * 2;;*)
(*Nos va a dar un error de compilación, más concretamente un error de 
tipo ya que hay un flotante donde debería haber un entero*)

(*3.0 + 2.0;;*)
(*Error de tipo ya que nos falta +. para que haga los calculos con 
dos numero flotantes*)

5 / 3;;
(* - : int = 1
va a hacer la división entre dos números enteros devolviendo otro 
entero *)

5 mod 3;;
(* - : int = 2
va a devolver el resto de la división*)

(*3.0 *. 2.0 * 3.0;;*)
(*- : float = 24 
eleva 2.0 a 3.0 y luego multiplica por 3.0*)

3.0 = float_of_int 3;;
(*- : bool = true *)

(*sqrt 4;;*)
(*Error: la expresión que se espera es de tipo float y le entra un int
-> error de tipo*)

int_of_float 2.1 + int_of_float (-2.9);;
(*- : int = 0 
pasa el float a int*)

truncate 2.1 + truncate (-2.9);;
(*- : int = 0 
pasa float a int*)

floor 2.1 +. floor (-2.9);;
(*redondea a un valor entero y devuelve un float, redondea 
al número menor*)
(*- : float = -1 *)

(*ceil 2.1 +. ceil -2.9;;
error de tipos *)

(*2.0 * 3.0 * 2.0;;*)
(* -: float = 512 *)

'B';;
(*- : char = 'B' *)


int_of_char 'A';;
(* - : int = 65 *)

char_of_int 66;;
(*- : char = 'B')*)

Char.code 'B';;
(*- : int = 66)*)

Char.chr 67;;
(*- : char = 'C')*)

'\067';;
(*Es como un Char.chr *)
(*- : char = 'C'*)

(*Char.chr (Char.code 'a' = Char.code 'A' + Char.code 'M');;*)
(* Char.code 'a' = Char.code 'A'  es falso más Char.code 'M' 
sigue siendo falso, entonces Char.code 'falso'
da error ya que es un bool y la expresión eperada es un tipo int. 
Error de tipos*)

(*Char.uppercase 'm';;*)
(*- : char = 'M' *)

(*Char.lowercase 'o';;*)
(*- : char = 'o' *)

"this is a string";;
(*- : string = "this is a string" *)

String.length "longitud";;
(*- : int = 8 *)

(*"1999" + "1";;
Error de tipos ya es una suma de dos números enteros
 y hay dos strings*)

"1999" ^ "1";;
(*- : string = "19991"*)
(*Suma los strings*)

int_of_string "1999" + 1;;
(*- : int = 2000 *)

"\064\065";;
(*- : string = "@A"*)

string_of_int 010;;
(*- : string = "10" *)

not true;;
(*- : bool = false *)

true && false;;
(*- : bool = false *)

true || false;;
(*- : bool = true *)

(1 < 2) = false;;
(*- : bool = false *)


"1" < "2";;
(*- : bool = true *)


2 < 12;;
(*- : bool = true *)

 
"2" < "12";;
(*- : bool = true *)
(*MAL:  - : bool = false. compara primero el primer
 número entonces la comparación es 2 < 1 *)


"uno" < "dos";;
(*- : bool = true *)
(*MAL:  - : bool = false. compara primero la primera letra por orden alfabético *)


if 3 = 4 then 0 else 4;;
(* - : int = 4*)

if 3 = 4 then "0" else "4";;
(* - : string = "4"*)

(*if 3 = 4 then 0 else "4";;*)
(* - : string = "4"
MAL: Error de tipos, expresión "0"  es string y la 4 es int *)

(if 3 < 5 then 8 else 10) + 4;;
(* - : int = 12*)


2.0 *. asin 1.0;;
(* - : float = 3.1415...*)


sin (2.0 *. asin 1.0 /. 2.);;
(* - : float = __*)


function x -> 2 * x;;
(* EStamos haciendo una función que devuelve el doble 
Es una expresión landa ya que es anónima
- : int -> int = <fun>*)

(function x -> 2 * x) (2 + 1);;
(* EStamos haciendo una función que devuelve el doble 
Es una expresión landa ya que es anónima
- : int= 6 *)

let x = 1;;
(*le damos el valor de 1 a x 
val x : int = 1*)

let y = 2;;
(*le damos el valor de 2 a y 
val y : int = 2*)

x - y;;
(*- : int = -1 *)

let x = y in x - y;;
(* - : int = 0
y= 2 , entonces x pasa a valer 2, y esta en 2-2 que es 0 *)

x - y;;
(* - : int = 0 *)

(*z;;*)
(*Error léxico, no existe el valor z *)

let z = x + y;;
(*val z : int = 4 *)

z;;
(*- : int = 4*)

let x = 5;;
(*val x: int = 5 *)

z;;
(*- : int = 4*)


let y = 5 in x + y;;
(*-: int = 10 *)


x + y;;
(*- : int = 7 *)

let x = x + y in let y = x * y in x + y +z;;
(*-- : int = 25
¿? - : int = 24*)

x + y + z;;
(*- : int = 10 *)

int_of_float;;
(*- : float -> int = <fun> *)

float_of_int;;
(*- : int -> float = <fun> *)

int_of_char;;
(*- : char -> int = <fun> *)

char_of_int;;
(*- : int -> char = <fun> *)

abs;;
(*- : int -> int = <fun> *)

sqrt;;
(*- : float -> float = <fun> *)

truncate;;
(*- : int -> int = <fun> 
MAL:  : float -> int = <fun> *)

ceil;;
(*- : int -> int = <fun> 
MAL: - : float -> float = <fun> *)

(floor;)
(*- : float -> float = <fun> *)

(*Char.code;;*)
(*- : char -> int = <fun> *)

(*Char.chr;;*)
(*- : int -> char = <fun> *)

(*Char.uppercase;;*)
(*- : char -> char = <fun> *)

(*Char.lowercase;;*)
(*- : char -> char = <fun> *)

(*int_of_string;;*)
(*- : string -> int = <fun> *)

(*string_of_int;;*)
(*- : int -> string = <fun> *)

(*String.length;;*)
(*- : string -> int = <fun> *)

let f = function x -> 2 * x;;
(*Hace la funcion de doble  *)

f (2 + 1);;
(*- : int = 6 *)

f 2 + 1;;
(*La función de doble de dos 4 + 1 = 5
- : int =5 *)

let n = 1;;
(*val n : int = 1 *)

let g x = x + n;;
(*let g(x)= x + n 
val g : int -> int = <fun>*)

g 3;;
(*- : int = 4 *)

let n = 5;;
(*val n : int = 5 *)

g 3;;
(*- : int = 8
MAL:  la función g(x) se guarda con n=1, cambiar valor 
a n a posteriori no afecta a funcion de g*)
