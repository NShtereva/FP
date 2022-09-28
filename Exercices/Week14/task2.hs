main :: IO ()
main = do
    print (size t1)
    print (height t2)
    print (sumTree t1)
    print (sumLeaves t2)
    print (inorder t1)
    print (inorder t2)

data BTree = Empty | Node Int BTree BTree

t1 :: BTree                                --    5
t1 = Node 5 (Node 2 Empty                  --   / \
                    (Node 3 Empty Empty))  --  2   6
            (Node 6 Empty Empty)           --   \
                                           --    3 
                                          
t2 :: BTree                                --    5
t2 = Node 5 (Node 3 Empty Empty)           --   / \
            (Node 4 (Node 5 Empty Empty)   --  3   4
                    (Node 7 Empty Empty))  --     / \
                                           --    5   7

-- a) 
size :: BTree -> Int
size Empty = 0
size (Node _ lt rt) = 1 + size lt + size rt

-- b)
height :: BTree -> Int
height Empty = 0
height (Node _ lt rt) = 1 + max (height lt) (height rt)

-- c)
sumTree :: BTree -> Int
sumTree Empty = 0
sumTree (Node root lt rt) = root + sumTree lt + sumTree rt

-- d)
sumLeaves :: BTree -> Int
sumLeaves Empty = 0
sumLeaves (Node root Empty Empty) = root
sumLeaves (Node root lt rt) = sumLeaves lt + sumLeaves rt

-- e)
inorder :: BTree -> [Int]
inorder Empty = []
inorder (Node root lt rt) = inorder lt ++ [root] ++ inorder rt
