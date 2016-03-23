-- contoh implementasi mep
mapListComprehension :: (a -> b) -> [a] -> [b]
mapListComprehension f xs = [ f x | x <- xs]

mapRecursive :: (a -> b) -> [a] -> [b]
mapRecursive f (x:xs) = f x : mapRecursive xs

-- implementasi beberapa fungsi menggunakan map
tailList :: [[a]] -> [[a]]
tailList lss = map tail lss

total :: [(Int, Int)] -> Int
total items = totalize (map subTotal items)
	where
		subTotal :: (Int, Int) -> Int
		subTotal (a, b) = a * b
		totalize :: [Int] -> Int
		totalize [] = 0
		totalize (x:xs) = x + totalize xs


-- contoh implementasi zipWith
zipWith' :: (a->b->c) -> [a] -> [b] -> [c]