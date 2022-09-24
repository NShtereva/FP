main :: IO ()
main = do
    print (isPrime 1)
    print (isPrime 2)
    print (isPrime 3)
    print (isPrime 21)

isPrime :: Int -> Bool
isPrime n 
    | n < 2 = False
    | n `mod` 2 == 0 = n == 2 
    | otherwise = helper 3
    where 
        helper d
            | d == n = True
            | n `mod` d == 0 = False
            | otherwise = helper (d + 2)
