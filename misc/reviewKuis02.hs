-------------
-- TYPE CLASS
-------------

-- declaring a class
class Visible a where
	toString :: a -> String
	size :: a -> Int

-- declaring an instance
instance Visible Char where
	toString ch = [ch]
	size _ = 1

instance Visible Bool where
	toString True = "True"
	toString False = "False"
	size _ = 1

instance Visible a => Visible [a] where
	toString = concat . map toString
	size = foldr (+) 1 . map size

-- default definitions
class Eq a where
	(==), (/=) :: a -> a -> Bool
	x == y = not (x /= y)
	x /= y = not (x == y)

-- derived classes
class Eq a => Ord a where
	compare :: a -> a -> Ordering
	(<), (<=), (>), (>=) :: a -> a -> Bool
	max, min :: a -> a -> a

-- multiple constraint
vSort :: (Ord a, Visible a) => [a] -> String
vSort = toString . iSort

-- multiple constraint in instance declaration
instance (Eq a, Eq b) => Eq (a,b) where
	(x,y) == (a,b) = x == a && y == b


-------------
-- TYPE CHECK
-------------


-------------
-- ALGEBRAIC
-------------

-- enumerated types
data Temp = Cold | Hot
data Season = Spring | Summer | Autumn | Winter

weather :: Season -> Temp
weather Summer = Hot
weather _ = Cold

-- product types
data People = Person Name Age
type Name = String
type Age = Int

showPerson :: People -> String
showPerson (Person st n) = 	st ++ " -- " ++ show n

-- general form

-- deriving instance of classes
data Temp = Cold | Hot
			deriving (Eq, Ord, Enum, Show, Read)

-- recursive algebraic types
data Expr = Lit Int |
			Add Expr Expr |
			Sub Expr Expr

eval :: Expr -> Int
eval (Lit n) = n
eval (Add e1 e2) = (eval e1) + (eval e2)
eval (Sub e1 e2) = (eval e1) - (eval e2)

-- mutual recursive types

-- polymorphic algebraic types
data Pairs a = Pr a a

-- the union type, Either
data Either a b = Left a | Right b
				deriving (Eq, Ord, Read, Show)

{- example: 
	Left "Indonesia" :: Either String Int
	Right 10 :: Either String Int	
-}

either :: (a -> c) -> (b -> c) -> Either a b -> c
either f g (Left x) = f x
either f g (Right y) = g y

-- Error types
data Maybe a = Nothing | Just a
				deriving (Eq, Ord, Read, Show)

errDiv :: Int -> Int -> Maybe Int
errDiv n m
	| m == 0 = Nothing
	| otherwise = Just (n `div` m)

mapMaybe' :: (a -> b) -> Maybe a -> Maybe b
mapMaybe' g Nothing = Nothing
mapMaybe' g (Just x) = Just (g x)

maybe :: b -> (a -> b) -> Maybe a -> b
maybe n f Nothing = n
maybe n f (Just x) = f z
