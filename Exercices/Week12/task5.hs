main :: IO ()
main = do
    print (insert 5 [-9, 0, 3, 4, 12])

insert :: Int -> [Int] -> [Int]
insert a [] = [a]
insert a xs = [x | x <- xs, x <= a] ++ [a] ++ [x | x <- xs, x > a]
