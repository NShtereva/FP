main :: IO ()
main = do
    print (mygcd 12 3)
    print (mygcd 1 5)
    print (mygcd 17 15)

mygcd :: Int -> Int -> Int
mygcd a b 
    | a == b = a
    | a > b = mygcd (a - b) b
    | otherwise = mygcd a (b - a)
