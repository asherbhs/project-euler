import Data.Function ((&))
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Set (Set)
import qualified Data.Set as Set

type Coin = Int

coins :: [Coin]
coins = [1, 2, 5, 10, 20, 50, 100, 200]

waysToMake :: Int -> Set (Map Coin Int)
waysToMake 0 = Set.singleton $ Map.fromList $ map (\c -> (c, 0)) coins
waysToMake x = coins
    & filter (<= x)
    & map 
        (\c -> Set.map 
            (Map.unionWith (+) (Map.singleton c 1))
            (waysToMake (x - c))
        )
    & foldl1 Set.union

main :: IO ()
main = print $ Set.size $ waysToMake 200