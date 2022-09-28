main :: IO ()
main = do
    print (getClosestPoint [Point2D 1 2, Point2D 3 4] (Point2D 0 0))

data Point = Point2D Double Double | Point3D Double Double Double
             deriving (Eq, Show)

distance :: Point -> Point -> Double
distance (Point2D x1 y1)    (Point2D x2 y2)     = sqrt ((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
distance (Point3D x1 y1 z1) (Point3D x2 y2 z2)  = sqrt ((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) + (z1 - z2) * (z1 - z2))
distance _                  _                   = error "Points of different dimensions"

getClosestPoint :: [Point] -> Point -> Point
getClosestPoint []       _  = error "Empty list"
getClosestPoint [p]      _  = p
getClosestPoint (x:y:xs) p  = if distance x p < distance y p
                              then getClosestPoint (x:xs) p
                              else getClosestPoint (y:xs) p
