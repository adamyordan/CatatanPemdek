-- Generating List

evenN :: Int -> [Int]
evenN 0 = []
evenN n = evenN (n-1) ++ [(2 * n)]

doubleList :: [Int] -> [Int]
doubleList [] = []
doubleList (x:xs) = 2*x : doubleList xs

-- Properti List

numOdd :: [Int] -> Int
numOdd [] = 0
numOdd (x:xs)
  | mod x 2 /= 0 = 1 + numOdd xs
  | otherwise = numOdd xs

multiplicity :: Int -> [Int] -> Int
multiplicity x [] = 0
multiplicity x (l:ls)
  | x == l = 1 + multiplicity x ls
  | otherwise = multiplicity x ls

listParity :: [a] -> Bool
listParity [] = True
listParity (x:xs) = not (listParity xs)

-- Removing and Filtering

removeEven :: [Int] -> [Int]
removeEven [] = []
removeEven (x:xs)
  | mod x 2 == 0 = removeEven xs
  | otherwise = x : removeEven xs

throwLastElmt :: [a] -> [a]
throwLastElmt (_:[]) = []
throwLastElmt (x:xs) = x : throwLastElmt xs


getLastElmt :: [a] -> a
getLastElmt (x:[]) = x
getLastElmt (x:xs) = getLastElmt xs

removeFirst :: Int -> [Int] -> [Int]
removeFirst n (x:xs)
  | n == x = xs
  | otherwise = x : removeFirst n xs

-- Inserting Element

addLast :: Int -> [Int] -> [Int]
addLast n (x:xs)
  | xs == [] = x : [n]
  | n == x = x:xs
  | otherwise = x : addLast n xs

insert :: Int -> [Int] -> [Int]
insert n (x:xs)
  | xs == [] = x : [n]
  | n > x = x : insert n xs
  | otherwise = n : x : xs


-- Soal Tambahan (Intermediate)

isTerurutMenaik :: [Int] -> Bool
isTerurutMenaik [] = True
isTerurutMenaik (x:xs)
  | xs == [] = True
  | x <= head xs = isTerurutMenaik xs
  | otherwise = False

findMax :: [Int] -> Int
findMax (x:[]) = x
findMax (x:xs) = max2 x (findMax xs)
		 where
		 max2 :: Int -> Int -> Int
		 max2 x y = if x > y then x else y 

split :: [Int] -> ([Int], [Int])
split ls = (evenIndex ls, oddIndex ls)
		where
		evenIndex :: [Int] -> [Int]
		evenIndex [] = []
		evenIndex (x:xs) = x : oddIndex xs
		oddIndex :: [Int] -> [Int]
		oddIndex [] = []
		oddIndex (x:xs) = evenIndex xs


insert' :: Int -> [(Int, Int)] -> [(Int, Int)]
insert' n [] = [(n, 1)]
insert' n ((val1, count1):xs)
  | n == val1 = (val1, count1 + 1) : xs
  | otherwise = (val1, count1) : insert' n xs
