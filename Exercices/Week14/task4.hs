main :: IO ()
main = do
    print (average t)

data BTree = Empty | Node Int BTree BTree

t :: BTree                                --    5
t = Node 5 (Node 2 Empty                  --   / \
                   (Node 3 Empty Empty))  --  2   6
           (Node 6 Empty Empty)           --   \
                                          --    3 

size :: BTree -> Int
size Empty = 0
size (Node _ lt rt) = 1 + size lt + size rt

sumTree :: BTree -> Int
sumTree Empty = 0
sumTree (Node root lt rt) = root + sumTree lt + sumTree rt

average :: BTree -> Double
average Empty = error "Empty tree"
average tree  = fromIntegral (sumTree tree) / fromIntegral (size tree)
