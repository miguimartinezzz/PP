type 'a bin_tree =
  Empty
| Node of 'a * 'a bin_tree * 'a bin_tree;;

let rec fold_tree f a = function
  Empty -> a
| Node (x, l, r) -> f x (fold_tree f a l) (fold_tree f a r);;

(* Implemente sum, prod, size, inorder y mirror usando fold_tree *)

let rec sum x = fold_tree(fun a b c-> a + b + c) 0 x;;

let rec prod x = fold_tree(fun a b c-> a *. b*. c) 1. x;;

let rec size x = fold_tree(fun a b c-> 1 + b + c) 0 x;;

let rec inorder x = fold_tree(fun a b c -> b@[a]@c) [] x;;

let rec mirror x = fold_tree(fun a b c -> Node(a,c,b)) Empty x;;
