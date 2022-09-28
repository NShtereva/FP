import Data.Char (isDigit, ord)
main :: IO ()
main = do
    print (decode "12a3b")  -- -> "aaaaaaaaaaaabbb"
    print (decode "a3b")    -- -> "abbb"
    print (decode "aa3b")   -- -> "aabbb"

getNumber :: String -> Int
getNumber ""  = 0
getNumber str = helper str 0
    where 
        helper s result
            | s == "" = result
            | not (isDigit (head s)) = result
            | otherwise = helper (tail s) (result * 10 + (ord (head s) - ord '0'))

clone :: Int -> String -> String
clone k str = replicate k (head (drop (length (show k)) str))

decode :: String -> String
decode "" = ""
decode str@(x:xs)
    | isDigit x = clone (getNumber str) str ++ decode (drop (length (show (getNumber str)) + 1) str)
    | otherwise = x : decode xs
