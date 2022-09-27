main :: IO ()
main = do
    print (isTriangular [[1,2,3],
                         [0,4,5],
                         [0,0,6]])

    print (isTriangular [[1,2,3],
                         [0,4,5],
                         [1,-1,6]])

isTriangular :: [[Int]] -> Bool
isTriangular []    = False
isTriangular [[_]] = True
isTriangular xss = helper 1 (tail xss)
    where
        helper _ [] = True
        helper n yss = n == length [x | x <- take n (head yss), x == 0] && 
                       helper (n + 1) (tail yss)
