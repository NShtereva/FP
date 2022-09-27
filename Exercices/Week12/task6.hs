main :: IO ()
main = do
    print (insertionSort [9, -3, 5, 0, 1])

insert :: Int -> [Int] -> [Int]
insert a [] = [a]
insert a xs = [x | x <- xs, x <= a] ++ [a] ++ [x | x <- xs, x > a]

insertionSort :: [Int] -> [Int]
insertionSort = foldr insert []
