data NTree = NilT |
			 Node Int NTree NTree
			 deriving Show

-- banyaknya node dalam tree
size :: NTree -> Int
size NilT = 0
size (Node _ t1 t2) = 1 + size t1 + size t2


-- jika ada maka true
member :: NTree -> Int -> Bool
member NilT _ = False
member (Node e t1 t2) n = (n == e) || member t1 n || member t2 n 


-- ganti semua angka ke angka baru
change :: NTree -> Int -> Int -> NTree
change NilT _ _ = NilT
change (Node e t1 t2) old new
  | e == old  = Node new (change t1 old new) (change t2 old new)
  | otherwise = Node e   (change t1 old new) (change t2 old new)

--data Tree a = NilT | 
--			  Node a NTree NTree

--inOrder :: Tree a -> [a]
--inOrder NilT = []
--inOrder (Node v t1 t2) = inOrder t1 ++ [v] ++ inOrder t2