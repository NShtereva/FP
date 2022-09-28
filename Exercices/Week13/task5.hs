main :: IO ()
main = do
    print (distance (Point2D 0 0) (Point2D 1 1))
    print (distance (Point3D 2 3 4) (Point3D 2 3 5))
    print (distance (Point2D 2 3) (Point3D 2 3 5))

data Point = Point2D Double Double | Point3D Double Double Double
             deriving (Eq, Show)

distance :: Point -> Point -> Double
distance (Point2D x1 y1)    (Point2D x2 y2)     = sqrt ((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2))
distance (Point3D x1 y1 z1) (Point3D x2 y2 z2)  = sqrt ((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) + (z1 - z2) * (z1 - z2))
distance _                  _                   = error "Points of different dimensions"
