main :: IO ()
main = do
    print (prodSumDiv [1..12] 2)

getDivisors :: Integer -> [Integer]
getDivisors n = [d | d <- [1..(n-1)], n `mod` d == 0] 

prodSumDiv :: [Integer] -> Integer -> Integer
prodSumDiv xs k = product [x | x <- xs, sum (getDivisors x) `mod` k == 0]
