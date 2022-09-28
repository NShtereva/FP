main :: IO ()
main =  do
    print (mirrorTree t)

data BTree = Empty | Node Int BTree BTree
             deriving Show

t :: BTree                                --     1
t = Node 1 (Node 2 (Node 5 Empty Empty)   --    / \
                   Empty)                 --   2   3
           (Node 3 (Node 7 Empty Empty)   --  /   / \
                   (Node 6 Empty Empty))  -- 5   7   6

mirrorTree :: BTree -> BTree
mirrorTree Empty = Empty
mirrorTree (Node root lt rt) = (Node root (mirrorTree rt) (mirrorTree lt))
