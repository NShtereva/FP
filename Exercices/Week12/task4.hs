main :: IO ()
main = do
    print (merge [-3,0,9,14] [1,2,3])

merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) = if x < y
                      then x : merge xs (y:ys)
                      else y : merge (x:xs) ys
            