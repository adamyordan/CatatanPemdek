--data Vehicle = Bike |
--              Motorbike Power |
--              Car IsRobin |
--              Lorry NumWheel
--
--type Power = Int
--type IsRobin = Bool
--type NumWheel = Int

data Vehicle = Bike |
              Motorbike Int |
              Car Bool |
              Lorry Int
              deriving (Eq, Show)

mobil :: Vehicle
mobil = Car True

listKendaraan :: [Vehicle]
listKendaraan = [Car True, Lorry 8, Lorry 10, Car False, Bike]


-- fungsi wheels menghitung banyak wheels
wheels :: Vehicle -> Int
wheels (Bike) = 2
wheels (Motorbike _) = 2
wheels (Car isRobin) = if isRobin then 3 else 4
wheels (Lorry n) = n

data Temp = Cold | Hot

instance Eq Temp where
	Cold == Cold = True
	Hot == Hot = True
	_ == _ = False

-- Enum cuma boleh di derive kalau semuanya unary!!
-- [Hot ..] ~> [Hot]


data Season = Spring | Summer | Autumn | Winter
	deriving (Eq, Ord, Enum, Show, Read)

{-
	[Cold ..] ~> [Cold, Hot]
	[Summer .. Winter] ~> [Summer, Autumn, Winter]
	Summer < Winter ~> True
	[Hot ..] ~> [Hot]	
-}