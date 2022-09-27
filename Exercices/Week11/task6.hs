main :: IO ()
main = do
    print (divisors 1)
    print (divisors 12)
    print (divisors 17)
    print (divisors' 1)
    print (divisors' 12)
    print (divisors' 17)

divisors :: Integer -> [Integer]
divisors n = helper 1 []
    where
        helper curr result
            | curr == n = reverse result
            | n `mod` curr == 0 = helper (curr + 1) (curr:result)
            | otherwise = helper (curr + 1) result

divisors' :: Integer -> [Integer]
divisors' n = [d | d <- [1..(n-1)], mod n d == 0]
