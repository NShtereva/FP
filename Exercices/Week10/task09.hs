main :: IO ()
main = do
    print (palindromeCounter 1 20)

myReverse :: Int -> Int
myReverse n = helper n 0
    where
        helper num result
            | num == 0 = result
            | otherwise = helper (num `div` 10) (result * 10 + (num `mod` 10))

isPalindrome :: Int -> Bool
isPalindrome n = n == (myReverse n)

palindromeCounter :: Int -> Int -> Int
palindromeCounter a b
    | a > b = 0
    | isPalindrome a = 1 + palindromeCounter (a + 1) b
    | otherwise = palindromeCounter (a + 1) b
