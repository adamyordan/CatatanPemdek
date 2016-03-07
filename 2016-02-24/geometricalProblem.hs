sumFun :: (Int -> Int) -> Int
sumFun f n
	| n == 0	= f 0
	| n > 0		= sumFun (n-1) + f n

identity :: Int -> Int
identity n = n

regions :: Int -> Int
regions n = sumFun identity n
