class YesNo a where
	value :: a -> Bool

instance YesNo Int where
	value 0 = False
	value _ = True

instance YesNo Bool where
	value a = a

instance YesNo [a] where
	value [] = False
	value _ = True


--- [1,2,3,4] + [2,5] = [3,7]
instance Num a => Num [a] where
	--_ + [] = []
	--[] + _ = []
	--(x:xs) + (y:ys) = (x + y) : (xs + ys)
	(+) = zipWith (+)

instance (Num a, Num b) => Num (a,b) where
	(x,y) + (m,n) = (x+m, y+n)