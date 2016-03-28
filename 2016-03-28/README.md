Associativity
=============

function application is `left-associative`
` f x y z == ((f x) y) z


`->` is right-associative
` int -> int -> int == int -> (int -> int)


Setiap fungsi di Haskell menerima TEPAT SATU (1) arguments.
` add 2 3 5 = (((add 2) 3) 5) `

(+2) ~> (\x -> x + 2)
(2+) ~> (\x -> 2 + x)


Curried Form
============

curried function adalah fungsi yang bisa diaplikasikan parsial.

```
-- curried form
multiply :: Int -> Int -> Int
multiply x y = x*y

-- uncurried form
multiply :: (Int, Int) -> Int
multiply (x, y) = x*y
```

curry and uncurry
```
curry :: ((a,b) -> c) -> a -> b -> c
curry g x y = g (x,y)

uncurry :: (a -> b -> c) -> (a,b) -> c
uncurry g (x,y) = g x y
```

```
trivial:
foldr adalah kepanjangan dari fold right, bukan folder
```