rpm :: Int -> Int -> Int
rpm m 0 = 0
rpm m n 
	| even n    = rpm (m*2) (n `div` 2)
	| otherwise = rpm (m*2) (n `div` 2) + m

