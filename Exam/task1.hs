main :: IO ()
main = do
    print (rotate 5 ['a','b','c','d','e','f','g','h'])      -- --> "fghabcde"
    print (rotate 8 ['a','b','c','d','e','f','g','h'])      -- --> "abcdefgh"
    print (rotate 11 ['a','b','c','d','e','f','g','h'])     -- --> "defghabc"
    print (rotate (-2) ['a','b','c','d','e','f','g','h'])   -- --> "ghabcdef"


rotate ::  Int -> [a] -> [a]
rotate _ [] = []
rotate 0 xs = xs
rotate n xs = if (abs n) `mod` (length xs) == 0
              then xs
              else helper n xs (n > 0)
    where
        helper n xs leftRotation
            | n == 0 = xs
            | leftRotation = helper (n - 1) (tail xs ++ [head xs]) leftRotation
            | otherwise = helper (n + 1) (last xs : init xs) leftRotation
