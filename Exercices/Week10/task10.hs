main :: IO ()
main = do
    print (divisorsCounter 12)

divisorsCounter :: Int -> Int
divisorsCounter n = helper 1 0
    where
        helper d counter
            | d > n = counter
            | n `mod` d == 0 = helper (d + 1) (counter + 1)
            | otherwise = helper (d + 1) counter
