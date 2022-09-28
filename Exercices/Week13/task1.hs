main :: IO ()
main = do
    print (Circle 2.5)
    print (Rectangle 10 15)
    print (Triangle 3 4 5)

data Shape = Circle Double | 
             Rectangle Double Double |
             Triangle Double Double Double

instance Show Shape where
    show (Circle r) = "Circle: r = " ++ show r 
    show (Rectangle a b) = "Rectangle: a = " ++ show a ++ ", b = " ++ show b
    show (Triangle a b c) = "Triangle: a = " ++ show a ++ ", b = " ++ show b ++ ", c = " ++ show c
