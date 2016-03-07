import Data.Char
capitalizeLetters :: String -> String
capitalizeLetters s = [toUpper x | x <- s, isLetter x]
