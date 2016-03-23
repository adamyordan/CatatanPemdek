{-
	Nomor 10. Notasi Lambda

	Hasil dari evaluasi ekspresi berikut

	(\x -> x + x) 3						~> 6
	(\(x,y) -> (y+y, x+x)) (2,3)		~> (6, 4)
	(\x y z -> x*y*z) 2 3 4				~> 24
	(\x y -> x y) (\x -> x + x) 4		~> 8
	(\x y -> x) (\x y -> y) 3 4 5		
		~> (\x y -> y) 4 5
		~> 5

	map (\(x,y) -> if x < y then x else y) [(1,2), (3,4), (5,2), (1,9)]
		~> [1, 3, 2, 1]

	map (map (\x -> x*x)) [[1,2], [3,3,6], [7]]
		~> [[1,4], [9,9,36], [49]]

	map (\x -> x * 2) (map (\x -> x + 1) [1 .. 8])
		~> map (\x -> x * 2) [2, 3, 4, 5, .., 9]
		~> [4, 6, 8, 10, .., 18]


}