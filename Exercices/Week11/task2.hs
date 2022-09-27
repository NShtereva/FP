main :: IO ()
main = do
    print (isAscending 5)
    print (isAscending 12345)
    print (isAscending 12325)

getDigits :: Integer -> [Integer]
getDigits n
    | n < 10 = [n]
    | otherwise = (n `mod` 10) : getDigits(n `div` 10)

isAscending :: Integer -> Bool
isAscending n = helper (reverse (getDigits n))
    where
        helper [] = True
        helper [_] = True
        helper (x:y:xs) = (x <= y) && helper (y:xs)
