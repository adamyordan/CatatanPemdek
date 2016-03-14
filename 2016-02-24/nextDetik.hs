nextDetik :: (Int, Int, Int) -> (Int, Int, Int)

nextDetik (h,m,s) = (( h + (m + (s+1) `div` 60) `div` 60) `mod` 24 , (m + (s+1) `div` 60) `mod` 60, (s+1) `mod` 60)
