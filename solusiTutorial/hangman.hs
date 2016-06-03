import System.IO

hangman :: IO()
hangman = do putStrLn "Think of a word: "
             word <- sgetLine
             putStrLn "Try to guess it: "
             guess word

getCh :: IO Char
getCh = do hSetEcho stdin False
           c <- getChar
           hSetEcho stdin True
           return c

sgetLine :: IO String
sgetLine = do c <- getCh
              if c == '\n'
                then do 
                  putStr "\n"
                  return []
                else do 
                  putStr "-"
                  cs <- sgetLine
                  return (c : cs)

diff :: String -> String -> String
diff [] ys = []
diff (x:xs) ys
  | isExist x ys = x : diff xs ys
  | otherwise    = '-' : diff xs ys

isExist :: Char -> String -> Bool
isExist x [] = False
isExist x (y:ys)
  | x == y    = True
  | otherwise = isExist x ys

guess :: String -> IO ()
guess word = do input <- getLine                
                if (word == input)
                  then putStrLn "You got it"
                  else do putStrLn (diff word input)
                          guess word