import Data.List (intercalate)

---- Tutorial 6

-- Soal 1
fibs :: [Integer]
fibs = fibshelper 0 1

fibshelper :: Integer -> Integer -> [Integer]
fibshelper a b = a : fibshelper b (a+b)

fibs' :: [Integer]
fibs' = 0 : 1 : zipWith (+) fibs (tail fibs)


data Stream a = Cons a (Stream a)

-- Soal 2
streamToList :: Stream a -> [a]
streamToList (Cons e rest) = e : streamToList rest

-- Soal 3
streamRepeat :: a -> Stream a
streamRepeat x = Cons x (streamRepeat x)

-- Soal 4
streamMap :: (a -> b) -> Stream a -> Stream b
streamMap f (Cons x xs) = Cons (f x) (streamMap f xs)

-- Soal 5
streamInterleave :: Stream a -> Stream a -> Stream a
streamInterleave (Cons x xs) ys = Cons x (streamInterleave ys xs)

-- Soal 6
nats :: Stream Integer
nats = Cons 0 (streamMap (+1) nats) 

-- Soal 7

-- Soal 8
pascal :: Int -> [Int]
pascal 0 = [1]
pascal n = zipWith (+) (appendZero prev) (prependZero prev)
  where
    prev = pascal $ n - 1
    appendZero = (0 :)
    prependZero = (++ [0])

main :: IO ()
main  = do
          n <- readLn
          let ans = pascal `map` [0..n-1]
          putStr $ unlines $ toStr `map` ans
        where
          toStr = intercalate " " . map show

main' :: IO ()
main'  = 
          readLn >>= \n ->
          let ans = pascal `map` [0..n-1]
          in putStr $ unlines $ toStr `map` ans
        where
          toStr = intercalate " " . map show

-- Soal 9
instance Monad Maybe where
  return = Just
  Nothing >>= _ = Nothing
  (Just x) >>= f = f x

-- Soal 10
instance Monad [] where
  return x = x : []
  xs >>= f = concat (map f xs)