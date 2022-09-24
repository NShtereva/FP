main :: IO ()
main = do
    print (myMin (-9) 3)
    print (myMin 3 (-9))

myMin :: Int -> Int -> Int
myMin x y = if x < y then x else y
