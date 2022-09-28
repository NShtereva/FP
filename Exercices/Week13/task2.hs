main :: IO ()
main = do
    print (perimeter (Circle 2))
    print (area (Rectangle 3 5))
    print (isRound (Rectangle 3 5))
    print (isRound (Circle 5))

data Shape = Circle Double | 
             Rectangle Double Double |
             Triangle Double Double Double
             deriving Show

-- a)
perimeter :: Shape -> Double
perimeter (Circle r)        = 2 * pi * r
perimeter (Rectangle a b)   = 2 * (a + b)
perimeter (Triangle a b c)  = a + b + c

-- b)
area :: Shape -> Double
area (Circle r)       = pi * r * r
area (Rectangle a b)  = a * b
area (Triangle a b c) = sqrt (p * (p - a) * (p - b) * (p - c))
    where p = (a + b + c) / 2

-- c)
isRound :: Shape -> Bool
isRound (Circle _)  = True
isRound _           = False
