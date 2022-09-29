main :: IO ()
main = do
    print (splitPoints (1,1) 5 [(1,2),(2,3),(10,15),(-1,1),(12,14)]) -- --> ([(1.0,2.0),(2.0,3.0),(-1.0,1.0)],[(10.0,15.0),(12.0,14.0)])

type Point = (Double, Double)

splitPoints :: Point -> Double -> [Point] -> ([Point], [Point])
splitPoints p r ps = ([x | x <- ps, isInCircle p r x], [x | x <- ps, not (isInCircle p r x)])
    where 
        isInCircle p r point = sqrt ((fst point - fst p) * (fst point - fst p) + 
                                     (snd point - snd p) * (snd point - snd p)) < r
