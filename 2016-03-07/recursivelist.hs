odd' :: [Int] -> [Int]
odd' [] = []
odd' (x:xs)
 | (mod x 2 /= 0) = x : odd' xs
 | otherwise      = odd' xs

-- append [1,2] [3,4] = [1,2,3,4]
append' :: [a] -> [a] -> [a]
append' [] ys = ys
append' (x:xs) ys = append' xs ys
