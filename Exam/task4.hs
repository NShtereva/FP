main :: IO ()
main = do
    print (deepestLeavesSum t1) -- --> 15 (7 + 8)
    print (deepestLeavesSum t2) -- --> 4

data BTree = Empty | Node Int BTree BTree

height :: BTree -> Int
height Empty = 0
height (Node _ lt rt) = 1 + max (height lt) (height rt)

getNodes :: BTree -> Int -> [Int]
getNodes Empty _ = []
getNodes (Node root lt rt) 1 = [root]
getNodes (Node root lt rt) level = getNodes lt (level - 1) ++ getNodes rt (level - 1)

deepestLeavesSum :: BTree -> Int
deepestLeavesSum Empty = 0
deepestLeavesSum tree = sum (getNodes tree (height tree))

t1 :: BTree                                       --       1
t1 = Node 1 (Node 2 (Node 4 (Node 7 Empty Empty)  --      / \
                            Empty)                --     2   3
                    (Node 5 Empty                 --    / \   \
                            Empty))               --   4   5   6
            (Node 3 Empty                         --  /         \
                    (Node 6 Empty                 -- 7           8
                            (Node 8 Empty Empty)))
                                                        
                                            --     1
t2 :: BTree                                 --    / \
t2 = Node 1 (Node 2 (Node 4 Empty Empty)    --   2   3
                    Empty)                  --  /
            (Node 3 Empty Empty)            -- 4
