import Data.Maybe (fromJust)
import Data.List (find)

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
main = print $ last $ primeFactors 600851475143