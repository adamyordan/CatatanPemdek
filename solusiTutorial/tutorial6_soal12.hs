import Control.Monad (replicateM_)

main :: IO()
main = do
    n <- readLn
    replicateM_ n (putStrLn "Hello World!")