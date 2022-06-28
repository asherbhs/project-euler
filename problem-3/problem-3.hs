import Data.Maybe (fromJust)
import Data.List (find)

primes :: [Int]
-- seive of Eratosphenes
primes = seive [2 ..]
  where
    seive (x : xs) = x : seive (filter (\n -> mod n x /= 0) xs)

primeFactors :: Int -> [Int]
primeFactors n
    | n <= 1 = []
    | otherwise = 
      let
        p = fromJust $ find (\x -> mod n x == 0) primes
      in
        p : primeFactors (div n p)

main :: IO ()
main = print $ maximum $ primeFactors 600851475143