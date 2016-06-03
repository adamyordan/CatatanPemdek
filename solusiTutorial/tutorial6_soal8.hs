import Data.List (intercalate)

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
