fibStep (u,v) - (v , u+v)

fibPair n
	| n == 0	= (0,1)
	| otherwise	= fibStep (fibPair (n-1))

fastFib :: Int -> Int
fastFib = fst . fibPair


superFib :: Int -> Int -> Int -> Int
superFib u v n
	| n == 0	= u
	| otherwise	= superFib v u+v n-1

