main :: IO ()
main = do
    print (area (Circle 2))
    print (area (Rectangle 3 5))
    print (area (Triangle 3 4 5))
    print (sumArea [Circle 2, Rectangle 3 5, Triangle 3 4 5])
    print (biggestShape [Circle 2, Rectangle 3 5, Triangle 3 4 5])

data Shape = Circle Double | 
             Rectangle Double Double |
             Triangle Double Double Double
             deriving Show

area :: Shape -> Double
area (Circle r)       = pi * r * r
area (Rectangle a b)  = a * b
area (Triangle a b c) = sqrt (p * (p - a) * (p - b) * (p - c))
    where p = (a + b + c) / 2

sumArea :: [Shape] -> Double
sumArea []      = 0
sumArea (x:xs)  = area x + sumArea xs

biggestShape :: [Shape] -> Shape
biggestShape [] = error "Empty list"
biggestShape [sh] = sh
biggestShape (x:y:xs) = if area x > area y
                        then biggestShape (x:xs)
                        else biggestShape (y:xs)
