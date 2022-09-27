main :: IO ()
main = do
    print (incrementAllBy [1, 2, 3] 5)
    print (multiplyAllBy [1, 2, 3] 5)
    print (filterSmallerThan [13, 1, -9, 2, 3, 12] 5)

incrementAllBy :: [Int] -> Int -> [Int]
incrementAllBy xs n = [x + n | x <- xs]

multiplyAllBy :: [Int] -> Int -> [Int]
multiplyAllBy xs n = [x * n | x <- xs]

filterSmallerThan :: [Int] -> Int -> [Int]
filterSmallerThan xs n = [x | x <- xs, x >= n]
