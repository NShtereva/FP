main :: IO ()
main = do
    print (primesInRange 1 100)

isPrime :: Integer -> Bool 
isPrime n = [1, n] == [d | d <- [1..n], n `mod` d == 0]

primesInRange :: Integer -> Integer -> [Integer]
primesInRange a b = [x | x <- [a..b], isPrime x]
