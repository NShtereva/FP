main :: IO ()
main = do
    print (myMaxDivisor 5)
    print (myMaxDivisor 21)

myMaxDivisor :: Int -> Int
myMaxDivisor x = helper (x - 1)
    where 
        helper d
            | x `mod` d == 0 = d 
            | otherwise = helper (d - 1)
