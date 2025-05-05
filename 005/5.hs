import Data.Function ((&))
import Data.List (find, group)
import Data.Maybe (fromJust)
import Data.Map (Map)
import qualified Data.Map as Map (fromList, unionWith, foldrWithKey)

primes :: [Int]
primes = seive [2 ..]
  where
    seive :: [Int] -> [Int]
    seive (x : xs) = x : seive (filter (\n -> mod n x /= 0) xs)

primeFactors :: Int -> [Int]
primeFactors n
    | n <= 1 = []
    | otherwise = p : primeFactors (div n p)
      where
        p = fromJust $ find (\x -> mod n x == 0) primes

main :: IO ()
main = print 
    $ [1 .. 20]
    & map (\n -> n
        & primeFactors
        & group
        & map (\xs -> (head xs, length xs))
        & Map.fromList
    )
    & foldr1 (Map.unionWith max)
    & Map.foldrWithKey (\n e p -> p * n^e) 1