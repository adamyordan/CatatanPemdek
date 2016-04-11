-- soal 1
sum' :: [Int] -> Int
sum' = foldr (+) 0

-- soal 2
product' :: [Int] -> Int
product' = foldr (*) 1

-- soal 3
length' :: [Int] -> Int
length' = foldr (\_ x -> x + 1) 0

-- soal 4
all' :: (a -> Bool) -> [a] -> Bool
all' f = foldr (\x y -> f x && y) True

-- soal 5
any' :: (a -> Bool) -> [a] -> Bool
any' f = foldr (\x y -> f x || y) False

-- soal 6
map' :: (a -> b) -> [a] -> [b]
map' f = foldr (\x ys -> f x : ys) []

-- soal 7
filter' :: (a -> Bool) -> [a] -> [a]
filter' property = foldr (\x ys -> if property x then x:ys else ys) []

-- soal 8, tidak menggunakan flip
reverse' :: [a] -> [a]
reverse' = foldr (\x ys -> ys ++ [x]) []

-- soal 9
flatten :: [[a]] -> [a]
flatten = foldr (++) []

-- soal 10
collatz :: Int -> [Int]
collatz 1 = [1]
collatz x
	| even x = x : collatz (x `div` 2)
	| otherwise = x : collatz (3 * x + 1)

sumEvenCollatz :: Int -> Int
sumEvenCollatz x = sum (filter even (collatz x))

loop :: Int -> (Int -> a) -> [a]
loop 0 f = []
loop n f = f n : loop (n-1) f