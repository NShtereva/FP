main :: IO ()
main = do
    print (chunksOf 4 [1..15])

chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n xs = take n xs : chunksOf n (drop n xs)
