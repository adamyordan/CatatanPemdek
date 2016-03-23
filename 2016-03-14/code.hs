-- insertion sort
ins :: Int -> [Int] -> [Int]
ins x [] = [x]
ins x (y:ys)
	| x <= y    = x : (y:ys)
	| otherwise = y : ins x ys

iSort :: [Int] -> [Int]
iSort [] = []
iSort (x:xs) = ins x (iSort xs)


-- general recursion --
-----------------------

-- interleave [x1,x2,x3,...] [y1,y2,y3,...]
interleave :: [a] -> [a] -> [a]
interleave xs [] = xs
interleave [] ys = ys
interleave (x:xs) (y:ys) = x : y : interleave xs ys

-- zip
zip' :: [a] -> [b] -> [(a,b)]
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys
zip' _ _ = []

-- take 2 [5,6,7,8,9] = [5,6]
take' :: Int -> [a] -> [a]
take' 0 _ = []
take' _ [] = []
take' n (x:xs)
	| n > 0 = x : take (n-1) xs
take' _ _ = error "PreludeList.take: negative argument"

-- drop 2 [5,6,7,8,9] = [7,8,9]
drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' _ [] = []
drop' n (x:xs)
	| n > 0 = drop (n-1) xs
drop' _ _ = error "PreludeList.drop: negative argument"

-- quick sort
qSort = [Int] -> [Int]
qSort [] = []
qSort (x:xs) = qSort [ y | y <- xs, y <= x] ++ [x] ++ qSort [ y | y <- xs, y > x]

