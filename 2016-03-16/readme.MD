mapping
=======
-- map f xs
dimana f x = y
maka map f xs:
	[x1, x2, .., xn] = [f x1, f x2, .. , f xn]

map :: (a -> b) -> [a] -> [b]
map f xs = [f x | x <- xs]
 atau
map f (x:xs) = f x : map f xs

contoh mapping
==============
-- genap : [1,2,3] -> [(1,False) , (2,True) , (3,False)]

m :: Int -> (Int, Bool)
m x = (x, x % 2 == 0)
genap :: [Int] -> [(Int, Bool)]
genap xs = map m xs


Lakukan evaluasi untuk: map inc (map sqr [2,3,4,1])
~> map inc [4, 9, 16, 1]
~> [5, 10, 17, 2]

