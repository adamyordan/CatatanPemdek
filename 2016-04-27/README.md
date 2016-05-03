Recursive Algebraic Types
=========================

data Expr = Lit Int |
			Add Expr Expr |
			Sub Expr Expr

misal:
5 				Lit 5
5 + 3			Add (Lit 5) (Lit 3)
(5 + 3) - 1		Sub (Add (Lit 5) (Lit 3)) (Lit 1)




data NTree = NilT |
			 Node Int NTree Ntree

misal:
  3
 / \
2	_

Node 3 (Node 2 NilT NilT) NilT




Functions over recursive algebraic types
========================================

eval :: Expr -> Int
eval (Lit n)     = n
eval (Add e1 e2) = (eval e1) + (eval e2)
eval (Sub e1 e2) = (eval e1) - (eval e2)



sumTree, depth :: Ntree -> Int

sumTree NilT           = 0
sumTree (Node n t1 t2) = n + sumTree t1 + sumTree t2

depth NilT = 0
depth (Node n t1 t2) = 1 + max (depth t1) (depth t2)

occurs :: NTree -> Int -> Int
occurs NilT p = 0
occurs (Node n t1 t2) p
  | n == p    = 1 + occurs t1 p + occurs t2 p
  | otherwise =     occurs t1 p + occurs t2 p




Mutual Recursive Types
======================
data Person  = Adult Name Address Biog |
               Child Name

data Biog    = Parent String [Person] |
               NonParent String

type Name    = String
type Address = String

// showPerson (Adult nm ad bio) = show nm ++ show ad ++ showBiog bio
// showBiog (Parent nm perList) = show nm ++ concat (showPerson perList)



Polymorphic Algebraic Types
===========================

data Pairs a = Pr a a

example:
Pr True False :: Pairs Bool
Pr 1 2        :: Pairs Int
Pr [1,2,3] [1,2] :: (Num a) => Pairs [a]


inOrder :: Tree a -> [a]
inOrder NilT = []
inOrder (Node v t1 t2) = inOrder t1 ++ [v] ++ inOrder t2


The union type, Either
======================
data Either a b = Left a | Right b
                  deriving (Eq, Ord, Read, Show)

Left  "Indonesia" :: Either String Int
Right 22000000000 :: Either String Int

isLeft :: Either a b -> Bool
isLeft (Left _) = True
isLeft (Right _) = False


Error Handling
==============
data Maybe a = Nothing | Just a
               deriving (Eq, Ord, Read, Show)

#1 error :: String -> ______
	contoh: error "tidak boleh dibagi nol"
	kelemahan: ketika gagal, komputasi stop, information loss

#2 dummy value
	contoh: head [] = 0
	kelemahan: program error atau tidak? Tidak ada pemberitahuan

#3 Tupe Data Maybe
	data Maybe = Nothing | Just a
	             deriving (Eq, Ord, Read, Show)


errDiv :: Int -> Int -> Maybe Int
errDiv n m
	| m /= 0 = Just (n `div` m)
	| otherwise = Nothing

contoh kasus:
#1
g = isEven
g 5 ~> False

g (Just 5) ~> ga bisa
fungsi g harus di LIFT dengan mapMaybe
(mapMaybe g) (Just 5) ~> Just False

#2
g (div 10 0) ~> bisa error
~> error di div ditransmit ke g karena fungsi mapMaybe


```
mapMaybe' :: (a->b) -> Maybe a -> Maybe b
mapMaybe' g Nothing = Nothing
mapMaybe' g (Just x) = Just (g x)

maybe :: b -> (a->b) -> Maybe a -> b
maybe n f Nothing = n
maybe n f (Just x) = f x
```
