-- numEqual menerima list items, misal xs; mengembalikan bilangan bulat berapa kali x muncul dalam xs
--numEqual :: Eq a => a -> [a] -> Int
numEqual x [] = 0
numEqual x (y:ys) = (if x == y then 1 else 0) + numEqual x ys

-- mendefinisikan fungsi member dengan menggunakan numEqual
--member :: Eq a => a -> [a] -> Bool
member x xs = numEqual x xs > 0



class Visible a where
	toString :: a -> String
	size:: a  -> Int

instance Visible Char where
	toString a = [a]
	size _ = 1


compare' :: (Visible a, Visible b) => a -> b -> Bool
compare' x y = size x <= size y
