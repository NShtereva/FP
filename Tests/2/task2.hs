main :: IO ()
main = do
    print (dominates (+4) (*2) [1..4]) -- --> True
    print (dominates (+4) (*2) [1..5]) -- --> False (5+4=9 < 5*2=10)

dominates :: (Int -> Int) -> (Int -> Int) -> [Int] -> Bool
dominates _ _ [] = False
dominates f g xs = and [abs (f x) >= abs (g x) | x <- xs] 
