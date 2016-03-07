type Waktu = (Int, Int, Int)
type Detik = Int

toDetik :: Waktu -> Detik
toDetik (j, m, d) = 3600 * j + 60 * m + d

toWaltu :: Detik -> Detik
toWaktu d = (div (mod d 86400) 3600 ,div (mod d 3600) 60, mod d 60)

nextDetik :: Waktu -> Waktu
nextDetik w = toWaktu(toDetik w + 1)
