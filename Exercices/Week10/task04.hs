main :: IO ()
main = do
    print (myFib 1)
    print (myFib 5)

myFib :: Int -> Int
myFib n
    | n == 1 || n == 2 = 1
    | otherwise = myFib (n - 1) + myFib (n - 2)
