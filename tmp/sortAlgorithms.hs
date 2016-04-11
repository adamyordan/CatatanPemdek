arr :: [Int]
arr = [10, 9, 4, 7, 2, -10, -2, 0, 1, 99, 10]

quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort (x:xs) = quickSort [y | y <- xs, y < x] ++ [x] ++ quickSort [y | y <- xs, y >= x]

insertionSort :: [Int] -> [Int]
insertionSort [] = []
insertionSort xs = foldr ins [] xs
	where
		ins :: Int -> [Int] -> [Int]
		ins y [] = [y]
		ins y (x:xs)
			| x <= y = x : ins y xs
			| otherwise = y : x : xs

mergeSort :: [Int] -> [Int]
mergeSort [] = []
mergeSort (a:[]) = [a]
mergeSort xs = merge (mergeSort left) (mergeSort right)
	where
		(left, right) = splitAt (length xs `div` 2) xs
		merge :: [Int] -> [Int]  -> [Int]
		merge as [] = as
		merge [] bs = bs