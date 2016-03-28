jum :: Int -> Int -> Int -> Int
jum x y z = x + y + z

{-


(tail . tail) [2 .. 6]
	~> tail (tail [2,3,4,5,6])
	~> tail [3,4,5,6]
	~> [4,5,6]

(tail . head . tail) [2 .. 6]
	~> TIDAK BOLEH, karena output dari head (elemen) tidak match dengan input tail (list)

(tail . tail . take) [2 .. 6]
	~> TIDAK BOLEH

(tail . tail . take 3) [2 .. 68]
	~> 4

(tail . take 3 . tail) [2 .. 8]
	~> [4,5]

(inc . jum 4 . double) 4
	~> TIDAK BOLEH

(inc . jum 4 3 . double) 4
	~> 16

(jum 1 2 . head . (++)) [2 .. 4]
	~> TIDAK BOLEH

(jum 1 2 . head . (++[3,4])) [2 .. 4]
	~> 5

(inc . (3+) . (*) . (+2) . head . tail) [3,4,5,6]
	~> TIDAK BOLEH

(inc . (3+) . (*2) . (+2) . head . tail) [3,4,5,6]
	~> 16

(tail . tail . take 3 . reverse) [2 .. 8]
	~> [6]


----------------------------------

map (+2) [1 .. 4]
	~> [3,4,5,6]

map (2+) [1 .. 4]
	~> [3,4,5,6]

map (\x -> x * 2) [1..4]
	~> [2,4,6,8]

map (map (+2)) [[1,2,3], [1,2], [3]]
	~> [[2,4,6], [2,4], [6]]

map (jum 2 3) [1 .. 4]
	~> [6,7,8,9]

skip skip beberapa nomor...

foldr (jum 5) 0 [1 .. 4]
	~> jum 5 1 (jum 5 2 (jum 5 3 (jum 5 4 0)))
	~> 30

-}


-- Curry and Uncurry
uncurry :: (a -> b -> c -> d) -> (a,b,c) -> d
uncurry x y z = uncurry (x,y,z)