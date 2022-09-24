main :: IO ()
main = do
    print (myFunc 5 3)

myFunc :: Double -> Double ->Double
myFunc x y = average (square x) (square y)
    where
        square n = n * n
        average a b = (a + b) / 2
