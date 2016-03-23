-- numPositif [1, -1, 1, 2, -3] = 3
incIfPositive :: Int -> Int -> Int
incIfPositive x counter
  | x > 0 = counter + 1
  | otherwise = counter

numPositif :: [Int] -> Int
numPositif xs = foldr incIfPositive 0 xs


-- FUNCTION COMPOSITION EXAMPLE --
inc :: Int -> Int
inc x = x + 1
dec :: Int -> Int
dec x = x - 1
sqr :: Int -> Int
sqr x = x * x
double :: Int -> Int
double x = x * 2

-- fungsi id : fungsi identitas mengembalikan dirinya
-- composeList [inc, dec, sqr, double] = inc . dec . sqr . double . id
-- (composeList [inc, dec]) 3 ~> (inc . sqr . id) 3 ~> 10
composeList :: [(a -> a)] -> (a -> a)
composeList listFs = foldr (.) id listFs
