main :: IO ()
main = do
    print (isImage [6,7,8] [1,2,3])
    print (isImage [6,7,8] [1,2,9])
    print (isImage [6] [1])

isImage :: [Int] -> [Int] -> Bool
isImage as bs =  as == [(head as - head bs) + bi | bi <- bs] 
