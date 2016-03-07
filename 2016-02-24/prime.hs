notDivisible :: Int -> Int -> Bool
notDivisible d n  = n `mod` d /= 0

test :: Int -> Int -> int -> Bool
test a b c 
	| a == b = notDivisible a c
	| otherwise = notDivisible a c && test (a+1) b c

prime :: Int -> Bool
prime n = test 2 sqrt(n) n
