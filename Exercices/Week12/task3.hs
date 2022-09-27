main :: IO ()
main = do
    print (isSorted [1,2,3,4,5])
    print (isSorted [1,2,3,2,5])

isSorted :: [Int] -> Bool
isSorted [] = True
isSorted [_] = True
isSorted (x:y:xs) = (x <= y) && isSorted (y:xs)
