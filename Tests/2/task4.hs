import Data.List
main :: IO ()
main = do
    print (isBinarySearchTree t1) -- --> True
    print (isBinarySearchTree t2) -- --> False
    print (isBinarySearchTree t3) -- --> False

data BTree = Empty | Node Int BTree BTree

leftRootRight :: BTree -> [Int]
leftRootRight Empty = []
leftRootRight (Node root lt rt) = leftRootRight lt ++ [root] ++ leftRootRight rt

isBinarySearchTree :: BTree -> Bool
isBinarySearchTree (Node _ Empty Empty) = True
isBinarySearchTree (Node root lt rt) = helper (leftRootRight lt) (leftRootRight rt)
    where 
        helper xs ys = all (root >)  [x | x <- xs] && (sort xs) == xs &&
                       all (root <=) [x | x <- ys] && (sort ys) == ys

t1 :: BTree                                 --    8
t1 = Node 8 (Node 3 (Node 1 Empty Empty)    --   / \
                    (Node 4 Empty Empty))   --  3   10
            (Node 10 (Node 9 Empty Empty)   -- / \ / \
                     (Node 14 Empty Empty)) -- 1 4 9 14

t2 :: BTree                                 --    8
t2 = Node 8 (Node 3 (Node 1 Empty Empty)    --   / \
                    (Node 4 Empty Empty))   --  3   10
            (Node 10 (Node 5 Empty Empty)   -- / \ / \
                     (Node 14 Empty Empty)) -- 1 4 5 14

t3 :: BTree                                 --    8
t3 = Node 8 (Node 3 (Node 5 Empty Empty)    --   / \
                    (Node 6 Empty Empty))   --  3  10
            (Node 10 (Node 9 Empty Empty)   -- / \ / \
                     (Node 14 Empty Empty)) -- 5 6 9 14
