Function Application
====================

not . not True <~ salah

mengapa? function application memiliki presedensi paling tinggi.

:t not ~> Bool -> Bool
:t (.) ~> (a -> b) -> (a -> b)

not . not True
:~> (a - > b) . Bool


function composition ~> f . x
function application ~> f x


Reversing Composition
=====================
define operator '>.>'

```
infixl 9 >.>
(>.>) :: (a -> b) -> (b -> c) -> (a -> c)
g >.> f = f . g
```


Expression defining function
============================
fungsi yang membentuk fungsi lain :v
```
-- fungsi addNum n mengembalikan sebuah fungsi yang menjumlahkan sesuatu dengan n
-- addNum 3 ~> (addN m = 3 + m) 
addNum :: Int -> (Int -> Int)
addNum n = addN
	where
		addN m = n + m
```

Anonymous Function
==================
Lambda-defined function is an anonymous function

(\x -> x*x) 4 
~> 16

sqr x = x*x
sama dengan
sqr =  (\x -> x*x)

(\x y -> x + y) 4 5
~> 9

//trivia: pakai notasi '\' karena mirip lambda :v
