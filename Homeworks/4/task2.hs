main :: IO ()
main = do
    print (countInteresting t1) -- -> 2 (4=2^2, 1=2^0)
    print (countInteresting t2) -- -> 3 (4=2^2, 2=2^1, 1=2^0)

data BTree = Empty | Node Int BTree BTree
             deriving Eq

isInteresting :: BTree -> Bool
isInteresting Empty = False
isInteresting (Node root lt rt)
    | lt == Empty && rt == Empty     = root == 1
    | (lt == Empty) /= (rt == Empty) = root == 2
    | otherwise                      = root == 4

countInteresting :: BTree -> Int
countInteresting Empty = 0
countInteresting tree@(Node root lt rt) = if isInteresting tree
                                          then 1 + countInteresting lt + countInteresting rt
                                          else countInteresting lt + countInteresting rt

t1 :: BTree                                --  16
t1 = Node 16 (Node 0 Empty Empty)          --  / \
             (Node 4 (Node 1 Empty Empty)  -- 0   4
                     (Node 0 Empty Empty)) --    / \
                                           --   1   0

t2 :: BTree                                --   4
t2 = Node 4 (Node 0 Empty Empty)           --  / \
            (Node 2 (Node 1 Empty Empty)   -- 0   2
                    Empty)                 --    /
                                           --   1 
    