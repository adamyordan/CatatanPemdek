Higher-order Function
=====================

foldr1
------
foldr1 f xs
	dimana
		f fungsi
		xs lst yang tidak boleh kosong

foldr1 f [x1,x2,x3, x4] = f x1 (f x2 (f x3 x4))


foldr
-----
```
-- foldr f s [] = s
-- foldr f s (x:xs) = f x (foldr f s xs)
foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f s [x1, x2, x3]  = f x1 (f x2 (f x3 s))

concat' :: [[a]] -> [a]
concat' xs = foldr (++) [] xs

and' :: [Bool] -> Bool
and bs = foldr (++) True bs

foldr1' f xs = foldr f (last xs) (init xs)

reverse' :: [a] -> [a]
reverse' xs = foldr snoc [] xs
	where
		snoc :: a -> [a] -> [a]
		snoc x xs = xs ++ [x]

```


Functions as Values
===================
function composition: ` (f . g) x = f (g x) `

```
sqr x = x * x
inc x = x + 1

f x = sqr (inc x)
    atau
f = sqr . inc

-- operator . juga merupakan sebuah fungsi infix
(.) :: (b -> c) -> (a -> b) -> (a -> c)
```

komposisi fungsi associative  ` f . (g . h) = (f . g) . h
di haskell, dia bersifat right-associative  ` f . g . h = f . (g . h) `
komposisi fungsi TIDAK komutatif  ` f . g /= g . f `

example:
```
*** :: Int -> Int  -- bukan wildcard, males nulis + biar singkat
inc x = x + 1
dec x = x - 1
sqr x = x * x
double x = x * 2

fs :: [(Int -> Int)]
fs = [inc, sqr, double, dec] 

-- (head fs) 4 ~> inc 4 ~> 5
-- (last fs) 7 ~> dec 7 ~> 6
-- (fs !! 1) 7 ~> sqr 7 ~> 49

``` 



