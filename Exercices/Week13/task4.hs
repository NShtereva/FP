main :: IO ()
main = do
    print ((Point2D 2 3) == (Point2D 2 3))
    print ((Point3D 2 3 4) == (Point3D 2 3 5))
    print ((Point2D 2 3) == (Point3D 2 3 5))

data Point = Point2D Double Double | Point3D Double Double Double

instance Eq Point where
    (==) (Point2D x1 y1)    (Point2D x2 y2)     = (x1 == x2 && y1 == y2)
    (==) (Point3D x1 y1 z1) (Point3D x2 y2 z2)  = (x1 == x2 && y1 == y2 && z1 == z2)
    (==) _                  _                   = error "Points of different dimensions"
