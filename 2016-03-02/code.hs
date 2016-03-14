-- LIST COMPREHENSION

divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], mod n x == 0]

matches :: Int -> [Int] -> [Int]
matches n m = [x | x <- m, x == n]

isElem :: Int -> [Int] -> Bool
isElem n m = matches n m /= []

double :: [[Int]] -> [[Int]]
double ls = [ [2*x|x <- l] | l <- ls]

sqrNum :: Int -> [(Int, Int)]
sqrNum n = [ (m, m^2) | m <- [0..n] ]

-- flatten :: [[Int]] -> [Int]
-- flatten ls = [i | i <- [l | l <- ls]]

half :: [a] -> ([a],[a])
-- half [1,2,3,4,5] = ([1,2], [3,4,5])
half ls = splitAt (div (length ls) 2) ls

sumList :: [Int] -> [Int] -> [Int]
-- sumList [1,2,3] [1,2] = [2,4]
sumList n m = [x+y | (x,y) <- (zip n m)] 
