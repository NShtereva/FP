main :: IO ()
main = do
    print (getLevel 1 t)
    print (getLevel 2 t)
    print (getLevel 3 t)
    print (getLevel 4 t)

data BTree = Empty | Node Int BTree BTree

t :: BTree                                --    5
t = Node 5 (Node 2 Empty                  --   / \
                   (Node 3 Empty Empty))  --  2   6
           (Node 6 Empty Empty)           --   \
                                          --    3 

getLevel :: Int -> BTree -> [Int]
getLevel _ Empty = []
getLevel 1 (Node root lt rt) = [root]
getLevel k (Node root lt rt) = getLevel (k - 1) lt ++ getLevel (k - 1) rt
