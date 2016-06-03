import Control.Monad (replicateM)

main :: IO()
main = do
  n <- readLn
  xs <- replicateM n readLn
  mapM_ print (reverse (filter (\x -> (x `mod` 2) /= 0) xs))