main :: IO ()
main = do
    print (isInside 3 0 5)
    print (isInside (-9) 0 5)
    print (isInside 0 0 5)
    print (isInside 5 0 5)

isInside :: Double -> Double -> Double -> Bool
isInside x a b = x >= a && x <= b
