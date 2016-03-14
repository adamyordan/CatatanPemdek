case CHECKEDVALUE of
	val1 -> code1
	val2 -> code2


sorting
=======

insertionSort [5,4,3,2,1]
- sort tail : [1,2,3,4]
- insert head ke sorted tail : insert 5 [1,2,3,4]


Higher Order Function
=======

twice f x = f(f x)
dimana: 
f sebuah fungsi,
x sebuah elemen

kali4 x = twice kali2 x
pangkat4 x = twice kuadrat x

benefit:
jika suatu saat kita mengubah implementasi dari twice, maka 
akan langsung berpengaruh pada fungsi kali4 dan pangkat4