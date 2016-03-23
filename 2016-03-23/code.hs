twice :: (a -> a) -> (a -> a)
twice f = f . f


iter :: Int -> (a -> a) -> (a -> a)
iter n f
  | n > 0     = f . iter (n-1) f
  | otherwise = id

iter' :: Int -> (a -> a) -> (a -> a)
iter' n f = foldr (.) id (replicate n f)

power2 :: Int -> Int
power2 n = iter n times2 1 
	where
		times2 :: Int -> Int
		times2 m = m * 2

power2' :: Int -> Int
power2' n = iter n (* 2) 1

-- fungsi addNum n mengembalikan sebuah fungsi yang menjumlahkan sesuatu dengan n
-- addNum 3 ~> (addN m = 3 + m) 
addNum :: Int -> (Int -> Int)
addNum n = addN
	where
		addN m = n + m


-- addNum dalam notasi lambda
addNum' :: Int -> (Int -> Int)
addNum' = (\n -> (\m -> n + m))