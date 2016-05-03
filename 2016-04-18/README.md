Type Checking
=============

Type:
- monomorphic
    - 'a' :: Char
    - True :: Bool
    - 3 :: Int

- polymorphic
    - length :: [a] -> Int

- contraint type class
    - member :: Eq a => a -> [a] -> Bool


Kegunaan type
- dokumentasi yang cukup
- indexing fungsi

Haskell merupakan bahasa pemrograman yang 'Strong Type', artinya:
sebelum ekspresi / definisi ini dijalankan, harus di cek dahulu apakah tipe nya mengikuti aturan tipe bahasa tersebut, jika gagal maka tidak akan dijalankan / dikompilasi


Type Checking Expression
========================
sory lagi skip :(
well-type?


Type Checking Monomorphic
=========================
pattern dikatakan konsisten dengan suatu type jika dalam type itu dapat ditemukan sebuah nilai yg sesuai dengan pattern tersebut.
contoh:
0:xs konsisten dengan [Int], karena terdapat misalnya [0,1,2,3] yg match

1. variabel pasti konsisten dengan tipe apapun.
   misal: umur dengan Int (umur = 25);  umur deengan String (umur = "abc")
 
2. Literal konsisten dengan tipenya.
   misal: True pasti konsisten dengan Bool

3. p:q konsisten dengan [T], jika [T] konsisten dengan p??? dan q konsisten dengan [T] 


Type Checking Polymorphic
=========================
```
f (x,y) = (x, ['a' .. y])
hence type of f is  f :: (a, Char) -> (a, [Char])

g (m, zs) = m + length zs
well typed!  g :: (Int, [a]) -> Int

h = g . f
well typed!  h :: (Int, Char) -> Int
```
unifikasi adalah mencari the most general unifier:
unifikasi antara (Int, [a]) dengan (a, [Char]) adalah (Int, [Char])  <- monotype
unifikasi antara (a,[a]) dengan ([b],c) menghasilkan ([b], [[b]]) <- polytype
unifikasi bisa gagal: [Int] -> [Int] dengan a -> [a]