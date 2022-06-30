import Data.Maybe (fromJust)
import Data.List (find, delete, nub)

triangleNumbers :: [Int]
triangleNumbers = scanl1 (+) [1 ..]

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

subsets :: [a] -> [[a]]
subsets [] = [[]]
subsets (x : xs) = let s = subsets xs in s ++ map (x :) s

factors :: Int -> [Int]
factors n
    | n <= 0    = undefined
    | otherwise = map product $ nub $ subsets $ primeFactors n

main :: IO ()
main = print $ fromJust $ find ((> 500) . length . factors) triangleNumbers