# Declaring an instance

Membuat instance dari sebuah Type Class
```
class Visible a where
	toString :: a -> String
	size:: a  -> Int

instance Visible Char where
	toString a = [a]
	size _ = 1
```

Membuat instance dengan kondisi, misalnya mendeclare that a list of Visible objects is also an instance of Visible
```
instance Visible a => Visible [a] where
	toString = concat . map toString
	size     = foldr (+) 1 . map size
```

Warning, berikut ini tidak diperbolehkan:
```
instance visible String  --type synonyms
instance visible [Int] --list
instance visible (Int, Bool) --pair


# Default Definitions
```
class Eq a where
	(==), (/=) :: a -> a -> Bool
	x /= y = not (x == y)
	x == y = not (x /= y)

-- wajib mengimplementasikan salah satu

-- note: ini akan error karena sudah didefinisikan oleh haskell
instance (Eq a, Eq b) => Eq (a,b) where
	(m,n) == (x,y) = (m == x) && (n == y)
```

# Derived Classes
classes can depend upon other classes to give their signature
```
-- sebelum a bisa mempunyai sifat Ord, pastikan terlebih dahulu a mempunyai sifat Eq
class Eq a => Ord a where
	compare :: a -> a -> Ordering
	(<), (<=), (>=), (>) :: a -> a -> Bool
	max, min :: a -> a -> a
```
berbeda dengan di Java, ketika mengimplementasikan fungsi di instance Ord, tidak usah mendefinisikan lagi fungsi (==) karena sudah dipastikan terlebih dahulu bahwa itu pasti Eq.


### Summary
Penggunaan Context ada 3:
1. member		` Eq a => a -> [a] -> Bool `
2. instance  	` instance Visible a => Visible [a] where `
3. inheritance	` class Eq a => Ord a where `

# Misc
Instance of multpile classes, definisikan saja dua kali

Multiple contraints, 
```
vSort :: (Ord a, Visible a) => a -> String
lookupFirst :: Eq a => [(a,b)] -> a -> [b]
lookupFirst :: (Eq a, Visible b) => [(a,b)] -> a -> String
blabal :: (Ord a, Visible a) => a -> String

-- hal diatas bisa dijadikan gini:

class (Ord a, Visible a) => OrdVis a
blabal :: OrdVis a => [a] -> String

```



