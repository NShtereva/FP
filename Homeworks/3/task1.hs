main :: IO ()
main = do
    print (encode "Haskell")           -- -> "Haskell"
    print (encode "aaabccdefff")       -- -> "3abccde3f"
    print (encode "aaaaaaaaaaaabbb")   -- -> "12a3b"
    print (encode "aabbb")             -- -> "aa3b"

getPreffix :: String -> String
getPreffix "" = ""
getPreffix [symbol] = [symbol]
getPreffix str = helper str (head str)
    where 
        helper s symbol
            | s == "" = ""
            | head s == symbol = head s : helper (tail s) symbol
            | otherwise = ""

encode :: String -> String
encode str 
    | length str < 3 = str
    | otherwise = helper (getPreffix str)
    where
        helper preffix = if length preffix <= 2
                         then preffix ++ encode (drop (length preffix) str)
                         else show (length preffix) ++ (head str : encode (drop (length preffix) str))
