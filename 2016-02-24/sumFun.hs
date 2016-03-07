sumFun :: (Int->Int) -> Int -> Int
sumFun f n
	| n == 0	= f 0
	| n > 0		= sumFun f (n-1) + f n

double :: Int -> Int
double n = n + n

sumDouble :: Int -> int
sumDouble n = sumFun double n
