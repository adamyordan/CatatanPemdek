Scope: part of the program in which the definition can be used

Local definitions by where clauses: only visible in the conditional equation the appear.


List patterns
=============

head :: [a] -> a
head (x:_) = x

tail :: [a] -> a
tail (_:x) = x

null :: [a] -> Bool
null [] = True
null (_:_) = False

sum :: [Int] -> Int
sum [] = 0
sum (x:xs) = x + sum xs

-- odd [1,2,3,4] = [1,3]
odd :: [Int] -> [Int]
odd [] = []
odd (x:xs)
 | (mod x 2 /= 0) = x : odd (xs)
 | otherwise      = odd(xs)
