main :: IO ()
main = do
    print (getAverageBalance (accounts1, people1) (\ (_, _, city) -> city == "Burgas"))         -- -> 24.95 (24.950000000000003)
    print (getAverageBalance (accounts1, people1) (\ (_, (n:_), _) -> n == 'P'))                -- -> 18.85
    print (averageBalanceOfCities (accounts1, people1) ["Sofia", "Gabrovo", "Stara Zagora"])    -- -> 67.85

type Account = (Int, Int, Double)
type Person = (Int, String, String)

people1 = [(1, "Ivan", "Sofia"), (2, "Georgi", "Burgas"), (3, "Petar", "Plovdiv"), (4, "Petya", "Burgas")]
accounts1 = [(1, 1, 12.5), (2, 1, 123.2), (3, 2, 13.0), (4, 2, 50.2), (5, 2, 17.2), (6, 3, 18.3), (7, 4, 19.4)]

-- a)
getId :: Person -> Int 
getId (id, _, _) = id

getPersonId :: Account -> Int 
getPersonId (_, personId, _) = personId

getBalance :: Account -> Double
getBalance (_, _, balance) = balance

getAverageBalance :: ([Account], [Person]) -> (Person -> Bool) -> Double
getAverageBalance ([], _) _ = 0
getAverageBalance (_, []) _ = 0
getAverageBalance (as, ps) p = if count /= 0 then s / fromIntegral count else 0 
    where
        ids = [getId x | x <- ps, p x]
        accounts = [x | x <- as, any (getPersonId x==) ids]
        s = sum [getBalance x | x <- accounts]
        count = length accounts

-- b)
type Balance = Double

cityBalance :: ([Account], [Person]) -> String -> Balance
cityBalance ([], _) _ = 0
cityBalance (_, []) _ = 0
cityBalance (_, _) "" = 0
cityBalance db name = getAverageBalance db (\ (_, _, city) -> city == name)

averageBalanceOfCities :: ([Account], [Person]) -> [String] -> Balance
averageBalanceOfCities ([], _) _ = 0
averageBalanceOfCities (_, []) _ = 0
averageBalanceOfCities (_, _) [] = 0
averageBalanceOfCities db cities = helper cities 0
    where
        helper c av
            | null c = av
            | otherwise = helper (tail c) (av + getAverageBalance db (\ (_, _, city) -> city == head c))
