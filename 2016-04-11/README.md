# Type Class

Kumpulan kelas yang memiliki sifat yang sama. Sifat-sifat tersebut di manifestasikan kedalam bentuk signature fungsi. 

2,3,4,7 <~ Int
'a','b','c' <~ Char
35.0, 37.0 <~ Float

Int,Char,Float adalah Type
Int,Char,Float (misalnya) adalah Eq

Eq adalah Type Class (atau hanya Class) dimana dapat diaplikasikan fungsi `==`


## How do we define Eq?

```
class Eq a where
	(==) :: a -> a -> Bool
```

` Eq ` adalah class name
` a  ` adalah type char
` (==) :: a -> a -> Bool ` adalah signature

Members of a type class is called `instances`
misalnya, Int instance dari Eq

```
class disini tidak mirip dengan class di java, lebih mirip dengan interface
```

```
allEqual :: Int -> Int -> Int -> Bool
allEqual m n p = (m == n) && (n == p)

can be generalized to

allEqual :: Eq a => a -> a -> a -> Bool
allEqual m n p = (m == n) && (n == p)

-- Eq a disebut context, context bisa lebih dari satu, dipisahkan dengan ','
```

